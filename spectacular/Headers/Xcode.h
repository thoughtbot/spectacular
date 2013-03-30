//Headers dumped from IDEKit, IDEFoundation, DVTKit, and DVTFoundation

@interface IDEIndex : NSObject

//+ (id)resolutionForName:(id)arg1 kind:(id)arg2 containerName:(id)arg3;
- (id)filesContaining:(id)arg1 anchorStart:(BOOL)arg2 anchorEnd:(BOOL)arg3 subsequence:(BOOL)arg4 ignoreCase:(BOOL)arg5 cancelWhen:(id)arg6;

@end

@interface IDEWorkspace : NSObject

@property(retain) IDEIndex *index;
//
//- (void)_updateIndexableFiles:(id)arg1;
//
@end

@interface IDEIndexCollection : NSObject

- (id)firstObject;
//- (id)allObjects;

@end

//@interface IDEEditor : NSObject
//
//@end

@interface IDENavigableItem : NSObject

@end

@interface IDEDocumentURLNavigableItem : IDENavigableItem

- (id)initWithRepresentedObject:(id)arg1;

//- (id)fileURL;
//- (id)contentDocumentLocation;
//- (id)documentType;
//- (id)name;
//- (id)newImage;
//- (id)_documentURL;

@end

@interface IDENavigableItemCoordinator : NSObject

- (void)registerNavigableItem:(IDENavigableItem *)navigableItem;
- (id)structureNavigableItemForDocumentURL:(id)arg1 inWorkspace:(id)arg2 error:(id *)arg3;

@end

@interface IDEEditorContext : NSObject

@property(retain, nonatomic) IDENavigableItem *navigableItem; // @synthesize navigableItem=_navigableItem;

@property(readonly) IDENavigableItemCoordinator *navigableItemCoordinator; // @synthesize navigableItemCoordinator=_navigableItemCoordinator;
//- (void)setNavBarNavigableItem:(id)arg1;

//- (int)_openNavigableItem:(id)arg1 withContentsOfURL:(id)arg2 shouldInstallEditorBlock:(id)arg3;
//- (void)_navigateAwayFromCurrentDocumentWithURL:(id)arg1;
- (id)currentHistoryItem;

- (IDEWorkspace *)workspace;

@end

@interface IDEEditorHistoryItem : NSObject

@property(readonly) NSURL *documentURL;

@end

@interface DVTFilePath : NSObject

@property (readonly) NSURL *fileURL;

@end

