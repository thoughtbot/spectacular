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
@property (nonatomic, strong) NSMutableArray *loggedNotifications;
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

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    [self setupMenuItem];
}

- (void)registerForNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateActiveEditorContext:) name:@"IDEEditorAreaLastActiveEditorContextDidChangeNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidFinishLaunching:) name:NSApplicationDidFinishLaunchingNotification object:nil];
}

- (void)updateActiveEditorContext:(NSNotification *)notification
{
    self.currentEditorContext = [notification userInfo][@"IDEEditorContext"];
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
    IDEIndexCollection *indexCollection = [self.currentIndex filesContaining:specFileName anchorStart:NO anchorEnd:YES subsequence:NO ignoreCase:YES cancelWhen:nil];

    NSLog(@"%@", [indexCollection allObjects]);
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
