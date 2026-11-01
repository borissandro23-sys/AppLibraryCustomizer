#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Initial diagnostic scaffold only.
// No private App Library classes are hooked in this version.

%ctor {
    @autoreleasepool {
        NSLog(@"[AppLibraryCustomizer] Loaded in process: %@", NSProcessInfo.processInfo.processName);
    }
}
