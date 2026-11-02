#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <stdlib.h>
#import <string.h>

// Diagnostic-only discovery. This does not hook or modify SpringBoard classes.
%ctor {
    @autoreleasepool {
        NSString *processName = NSProcessInfo.processInfo.processName;
        NSLog(@"[AppLibraryCustomizer] Loaded in process: %@", processName);

        if (![processName isEqualToString:@"SpringBoard"]) {
            return;
        }

        int classCount = objc_getClassList(NULL, 0);
        if (classCount <= 0) {
            NSLog(@"[AppLibraryCustomizer] Runtime class list is unavailable.");
            return;
        }

        Class *classes = (Class *)calloc((size_t)classCount, sizeof(Class));
        if (classes == NULL) {
            NSLog(@"[AppLibraryCustomizer] Could not allocate class list.");
            return;
        }

        classCount = objc_getClassList(classes, classCount);
        NSUInteger matches = 0;

        for (int i = 0; i < classCount; i++) {
            const char *name = class_getName(classes[i]);
            if (name != NULL &&
                (strstr(name, "Library") != NULL ||
                 strstr(name, "Category") != NULL)) {
                NSLog(@"[AppLibraryCustomizer] Candidate class: %s", name);
                matches++;
            }
        }

        NSLog(@"[AppLibraryCustomizer] Discovery complete. Candidate classes: %lu",
              (unsigned long)matches);
        free(classes);
    }
}
