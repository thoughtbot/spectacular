//
//  TBSpectacular.m
//  spectacular
//
//  Created by Gordon Fontenot on 3/22/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "TBSpectacularPlugin.h"

@interface TBSpectacularPlugin ()

@property (nonatomic, strong) NSMenuItem *specMenuItem;

@end

@implementation TBSpectacularPlugin

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

- (id)init
{
    self = [super init];
    if (!self) return nil;

    [self.specMenuItem setTitle:@"Jump to test file"];
    return self;

}

- (void)addMenuItems
{
}

- (void)jumpToSpec
{
    [self.specMenuItem setTitle:@"Howdy!!!"];
}

- (BOOL)validateMenuItem:(NSMenuItem *)menuItem
{
    return YES;
}

#pragma mark - Getters

- (NSMenuItem *)specMenuItem
{
    if (!_specMenuItem) {
        NSMenu *mainMenu = [NSApp mainMenu];
        
        NSMenuItem *navMenu = [mainMenu itemWithTitle:@"Edit"];
        _specMenuItem = [[NSMenuItem alloc] initWithTitle:@"" action:@selector(jumpToSpec) keyEquivalent:@"t"];
        [_specMenuItem setKeyEquivalentModifierMask:NSControlKeyMask | NSAlternateKeyMask | NSCommandKeyMask];
        [_specMenuItem setTarget:self];
        [[navMenu submenu] addItem:_specMenuItem];
    }

    return _specMenuItem;
}

@end
