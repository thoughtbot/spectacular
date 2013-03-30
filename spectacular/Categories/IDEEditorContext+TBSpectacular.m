//
//  IDEEditorContext+TBSpectacular.m
//  spectacular
//
//  Created by Gordon Fontenot on 3/29/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "IDEEditorContext+TBSpectacular.h"
#import "IDEEditorHistoryItem+TBSpectacular.h"
#import "IDEIndex+TBSpectacular.h"

@implementation IDEEditorContext (TBSpectacular)

- (void)tb_jumpToTestOrCounterpart
{
    NSString *counterpartFileName = [[self currentHistoryItem] tb_counterpartName];
    DVTFilePath *counterpartFilePath = [[[self workspace] index] tb_filePathForFileWithName:counterpartFileName];

    if (counterpartFilePath)
    {
        IDENavigableItemCoordinator *navigableCoordinator = self.navigableItemCoordinator;
        IDENavigableItem *navigableItem = [navigableCoordinator structureNavigableItemForDocumentURL:[counterpartFilePath fileURL] inWorkspace:[self workspace] error:nil];

        self.navigableItem = navigableItem;
    }
}

@end
