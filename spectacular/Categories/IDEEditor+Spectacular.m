//
//  IDEEditor+Spectacular.m
//  spectacular
//
//  Created by Gordon Fontenot on 3/29/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "IDEEditor+Spectacular.h"
#import "TBSpectacularPlugin.h"
#import "JRSwizzle.h"

//@implementation IDEEditor (Spectacular)

//+ (void)load
//{
//    [self jr_swizzleMethod:@selector(didSetupEditor) withMethod:@selector(tb_didSetupEditor) error:nil];
//}
//
//- (void)tb_didSetupEditor
//{
//    [self tb_didSetupEditor];
//
//    [self addObserver:[TBSpectacularPlugin sharedPlugin] forKeyPath:@"document" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
//    objc_setAssociatedObject(self, DID_REGISTER_OBSERVER_KEY, [NSNumber numberWithBool:YES], OBJC_ASSOCIATION_RETAIN);
//}

//@end
