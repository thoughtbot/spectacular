//
//  IDEWorkspace+Spectacular.m
//  spectacular
//
//  Created by Gordon Fontenot on 3/22/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "IDEWorkspace+Spectacular.h"
#import "JRSwizzle.h"
#import "TBSpectacularPlugin.h"

@implementation IDEWorkspace (Spectacular)

+ (void)load
{
    [self jr_swizzleMethod:@selector(_updateIndexableFiles:) withMethod:@selector(tb_updateIndexableFiles:) error:nil];
}

- (void)tb_updateIndexableFiles:(id)arg1
{
    [self tb_updateIndexableFiles:arg1];
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [[TBSpectacularPlugin sharedPlugin] setCurrentIndex:[self index]];
//    });
}

@end
