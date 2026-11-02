THEOS ?= $(HOME)/theos

ARCHS = arm64
TARGET = iphone:clang:14.5:14.0
THEOS_PACKAGE_SCHEME = rootless

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AppLibraryCustomizer

AppLibraryCustomizer_FILES = Tweak.xm
AppLibraryCustomizer_CFLAGS = -fobjc-arc -fno-modules
AppLibraryCustomizer_FRAMEWORKS = Foundation UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

BUNDLE_NAME = AppLibraryCustomizerPrefs

AppLibraryCustomizerPrefs_FILES = ALCRootListController.m
AppLibraryCustomizerPrefs_CFLAGS = -fobjc-arc
AppLibraryCustomizerPrefs_FRAMEWORKS = UIKit
AppLibraryCustomizerPrefs_PRIVATE_FRAMEWORKS = Preferences
AppLibraryCustomizerPrefs_INSTALL_PATH = /Library/PreferenceBundles
AppLibraryCustomizerPrefs_PLIST = Info.plist

include $(THEOS_MAKE_PATH)/bundle.mk
