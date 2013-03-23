//Headers dumped from IDEKit, IDEFoundation, DVTKit, and DVTFoundation

@interface IDEIndexCollection : NSObject

- (id)firstObject;

@end

@interface IDEIndex : NSObject

- (IDEIndexCollection *)filesContaining:(NSString *)string anchorStart:(BOOL)anchorStart anchorEnd:(BOOL)anchorEnd subsequence:(BOOL)subsequence ignoreCase:(BOOL)ignoreCase cancelWhen:(id)arg6;

@end

@interface IDEWorkspace : NSObject

@property(retain) IDEIndex *index;

@end

@interface IDENavigableItem : NSObject

@end

@interface IDENavigableItemCoordinator : NSObject

- (void)registerNavigableItem:(IDENavigableItem *)navigableItem;
- (IDENavigableItem *)structureNavigableItemForDocumentURL:(NSURL *)documentURL inWorkspace:(IDEWorkspace *)workspace error:(NSError *)error;

@end

@interface IDEEditorHistoryItem : NSObject

@property (readonly) NSURL *documentURL;

@end

@interface IDEEditorContext : NSObject

@property (retain, nonatomic) IDENavigableItem *navigableItem;
@property (readonly) IDENavigableItemCoordinator *navigableItemCoordinator;

- (IDEEditorHistoryItem *)currentHistoryItem;
- (IDEWorkspace *)workspace;

@end

@interface DVTFilePath : NSObject

@property (readonly) NSURL *fileURL;

@end
