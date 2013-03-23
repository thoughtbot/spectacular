//Headers dumped from IDEKit, IDEFoundation, DVTKit, and DVTFoundation

@interface IDEIndex : NSObject

+ (id)resolutionForName:(id)arg1 kind:(id)arg2 containerName:(id)arg3;
- (id)filesContaining:(id)arg1 anchorStart:(BOOL)arg2 anchorEnd:(BOOL)arg3 subsequence:(BOOL)arg4 ignoreCase:(BOOL)arg5 cancelWhen:(id)arg6;

@end

@interface IDEWorkspace : NSObject

@property(retain) IDEIndex *index;

- (void)_updateIndexableFiles:(id)arg1;

@end

@interface IDEIndexCollection : NSObject

- (id)allObjects;

@end

@interface IDEEditorContext : NSObject

- (id)currentHistoryItem;

@end

@interface IDEEditorHistoryItem : NSObject

@property(readonly) NSURL *documentURL; // @synthesize documentURL=_documentURL;

@end