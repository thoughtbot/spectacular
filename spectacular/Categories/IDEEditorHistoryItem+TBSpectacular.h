//
//  IDEEditorHistoryItem+TBSpectacular.h
//  spectacular
//
//  Created by Gordon Fontenot on 3/29/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "Xcode.h"

@interface IDEEditorHistoryItem (TBSpectacular)

/**
 If YES is passed:
    Foo => FooSpec
    Foo+Bar => FooSpec
    FooSpec => Foo

 If NO is passed:
    Foo => FooSpec
    Foo+Bar => Foo+BarSpec
    FooSpec => Foo
 */
- (NSString *)tb_counterpartName:(BOOL)ignoreCategory;
- (BOOL)tb_isSpecFile;

@end
