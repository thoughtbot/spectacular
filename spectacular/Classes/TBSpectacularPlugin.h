//
//  TBSpectacular.h
//  spectacular
//
//  Created by Gordon Fontenot on 3/22/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

@class IDEIndex;

@interface TBSpectacularPlugin : NSObject

@property (nonatomic, strong) IDEIndex *currentIndex;

+ (TBSpectacularPlugin *)sharedPlugin;

@end
