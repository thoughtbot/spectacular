//
//  IDEEditorHistoryItem+TBSpectacular.m
//  spectacular
//
//  Created by Gordon Fontenot on 3/29/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "IDEEditorHistoryItem+TBSpectacular.h"

@implementation IDEEditorHistoryItem (TBSpectacular)

#pragma mark - Public Methods

- (NSString *)tb_counterpartName:(BOOL)ignoreCategory
{
    NSString *activeFileName = [self _tb_baseFileName];

    if ([self tb_isSpecFile])
        return [activeFileName stringByReplacingOccurrencesOfString:@"Spec" withString:@".m"];
    else {
      if (ignoreCategory)
          activeFileName = [activeFileName componentsSeparatedByString:@"+"][0];

      return [activeFileName stringByAppendingString:@"Spec.m"];
    }
}

- (BOOL)tb_isSpecFile
{
    return [[self _tb_baseFileName] hasSuffix:@"Spec"];
}

#pragma mark - Private Methods

- (NSString *)_tb_baseFileName
{
    NSURL *currentURL = [self documentURL];
    return [[currentURL lastPathComponent] stringByDeletingPathExtension];
}

@end
