//
//  IDEIndex+TBSpectacular.h
//  spectacular
//
//  Created by Gordon Fontenot on 3/29/13.
//  Copyright (c) 2013 thoughtbot. All rights reserved.
//

#import "Xcode.h"

@interface IDEIndex (TBSpectacular)

- (DVTFilePath *)tb_filePathForFileWithName:(NSString *)fileName;

@end
