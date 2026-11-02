#import <UIKit/UIKit.h>

// Minimal declarations for the private Preferences framework APIs used by
// PreferenceLoader. Keeping these declarations local avoids relying on
// private headers being present in the build SDK.
@interface PSListController : UIViewController
- (NSArray *)specifiers;
@end

@interface PSSpecifier : NSObject
+ (instancetype)preferenceSpecifierNamed:(NSString *)name
                                  target:(id)target
                                     set:(SEL)set
                                     get:(SEL)get
                                  detail:(Class)detail
                                    cell:(NSInteger)cell
                                    edit:(Class)edit;
- (void)setProperty:(id)value forKey:(NSString *)key;
@end

enum {
    PSGroupCell = 0
};

@interface ALCRootListController : PSListController
@end

@implementation ALCRootListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        PSSpecifier *statusGroup =
            [PSSpecifier preferenceSpecifierNamed:@"Текущий статус"
                                            target:self
                                               set:NULL
                                               get:NULL
                                            detail:Nil
                                              cell:PSGroupCell
                                              edit:Nil];

        [statusGroup setProperty:
            @"App Library Customizer 0.3.0 — диагностическая сборка. "
             "Твик проверяет классы SpringBoard, связанные с App Library. "
             "Создание категорий, переименование и перемещение приложений "
             "пока не реализованы."
                     forKey:@"footerText"];

        _specifiers = @[statusGroup];
    }

    return _specifiers;
}

@end
