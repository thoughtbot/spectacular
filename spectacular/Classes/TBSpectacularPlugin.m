//
//  TBSpectacular.m
//  spectacular
//
//  Created by Gordon Fontenot on 3/22/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "TBSpectacularPlugin.h"
#import "Xcode.h"

@interface TBSpectacularPlugin ()

@property (nonatomic, strong) NSMenuItem *specMenuItem;
@property (nonatomic, strong) IDEEditorContext *currentEditorContext;

@end

@implementation TBSpectacularPlugin

#pragma mark - Class methods

static TBSpectacularPlugin *spectacularPlugin = nil;

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        spectacularPlugin = [[self alloc] init];
    });
}

+ (TBSpectacularPlugin *)sharedPlugin
{
    return spectacularPlugin;
}

#pragma mark - Lifecycle

- (id)init
{
    self = [super init];
    if (!self) return nil;

    [self registerForNotifications];

    return self;
}

#pragma mark - Private methods

- (void)notificationPosted:(NSNotification *)notification
{
    if (([[notification name] length] >= 2 && [[[notification name] substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"NS"]) || [[notification name] hasSuffix:@"UpdateLocalStatusNotification"]) {
        return;
    }

    NSLog(@"      Notification name: %@", [notification name]);
    NSLog(@"      Notification: %@", notification);
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    [self setupMenuItem];
}

- (void)registerForNotifications
{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationPosted:) name:nil object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateActiveEditorContext:) name:@"IDEEditorAreaLastActiveEditorContextDidChangeNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidFinishLaunching:) name:NSApplicationDidFinishLaunchingNotification object:nil];
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    NSString *documentPath = [[[object document] fileURL] path];
//    NSLog(@"                %@", documentPath);
//}

- (void)updateActiveEditorContext:(NSNotification *)notification
{
    NSLog(@"spectaular: Editor context changed: %@", [notification userInfo][@"IDEEditorContext"]);
    self.currentEditorContext = [notification userInfo][@"IDEEditorContext"];
    NSLog(@"spectacular: Currently active item: %@", [self activeFileName]);
}

- (void)setupMenuItem
{
    if (self.specMenuItem) return;

    NSMenu *mainMenu = [NSApp mainMenu];
    NSMenuItem *editMenu = [mainMenu itemWithTitle:@"Edit"];
    [[editMenu submenu] addItem:[NSMenuItem separatorItem]];
    self.specMenuItem = [[NSMenuItem alloc] initWithTitle:@"Jump to test file" action:@selector(jumpToSpec) keyEquivalent:@"t"];
    [self.specMenuItem setKeyEquivalentModifierMask:NSControlKeyMask | NSAlternateKeyMask | NSCommandKeyMask];
    [self.specMenuItem setTarget:self];
    [[editMenu submenu] addItem:self.specMenuItem];
}

- (void)jumpToSpec
{
    NSString *specFileName = [NSString stringWithFormat:@"%@spec.m", [self activeFileName]];
    IDEIndex *currentIndex = [[self.currentEditorContext workspace] index];
    IDEIndexCollection *indexCollection = [currentIndex filesContaining:specFileName anchorStart:NO anchorEnd:YES subsequence:NO ignoreCase:YES cancelWhen:nil];
    DVTFilePath *specFilePath = [indexCollection firstObject];

    if (specFilePath)
    {
        IDENavigableItemCoordinator *navigableCoordinator = self.currentEditorContext.navigableItemCoordinator;
        IDENavigableItem *navigableItem = [navigableCoordinator structureNavigableItemForDocumentURL:[specFilePath fileURL] inWorkspace:[self.currentEditorContext workspace] error:nil];

        self.currentEditorContext.navigableItem = navigableItem;
    }
}

- (IDEEditorHistoryItem *)activeHistoryItem
{
    return [self.currentEditorContext currentHistoryItem];
}

- (NSString *)activeFileName
{
    NSURL *currentURL = [[self activeHistoryItem] documentURL];
    return [[currentURL lastPathComponent] stringByDeletingPathExtension];
}

#pragma mark - Menu Item validation

- (BOOL)validateMenuItem:(NSMenuItem *)menuItem
{
    return YES;
}

@end
