//
//  IDEIndex+TBSpectacular.m
//  spectacular
//
//  Created by Gordon Fontenot on 3/29/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "IDEIndex+TBSpectacular.h"

@implementation IDEIndex (TBSpectacular)

- (DVTFilePath *)tb_counterpartWithFileName:(NSString *)counterpartFileName
{
    IDEIndexCollection *indexCollection = [self filesContaining:counterpartFileName anchorStart:NO anchorEnd:YES subsequence:NO ignoreCase:YES cancelWhen:nil];
    return [indexCollection firstObject];
}

@end
