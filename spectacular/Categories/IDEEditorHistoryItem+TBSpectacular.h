//
//  IDEEditorHistoryItem+TBSpectacular.h
//  spectacular
//
//  Created by Gordon Fontenot on 3/29/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "Xcode.h"

@interface IDEEditorHistoryItem (TBSpectacular)

- (NSString *)tb_counterpartName;
- (BOOL)tb_isSpecFile;

@end
