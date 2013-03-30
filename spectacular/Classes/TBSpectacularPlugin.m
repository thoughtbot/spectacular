//
//  TBSpectacular.m
//  spectacular
//
//  Created by Gordon Fontenot on 3/22/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "TBSpectacularPlugin.h"
#import "IDEEditorContext+TBSpectacular.h"
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

    [self setupMenuItem];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateActiveEditorContext:) name:@"IDEEditorAreaLastActiveEditorContextDidChangeNotification" object:nil];

    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

#pragma mark - Private methods

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
    self.specMenuItem = [[NSMenuItem alloc] initWithTitle:@"Jump to test file" action:@selector(toggleSpecFile) keyEquivalent:@"t"];
    [self.specMenuItem setKeyEquivalentModifierMask:NSControlKeyMask | NSAlternateKeyMask | NSCommandKeyMask];
    [self.specMenuItem setTarget:self];
    [[editMenu submenu] addItem:self.specMenuItem];
}

- (void)toggleSpecFile
{
    [self.currentEditorContext tb_jumpToTestOrCounterpart];
}

#pragma mark - Menu Item validation

- (BOOL)validateMenuItem:(NSMenuItem *)menuItem
{
    return YES;
}

@end
