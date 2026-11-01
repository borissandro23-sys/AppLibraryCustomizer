THEOS ?= $(HOME)/theos

ARCHS = arm64
TARGET = iphone:clang:latest:15.0
THEOS_PACKAGE_SCHEME = rootless

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AppLibraryCustomizer

AppLibraryCustomizer_FILES = Tweak.xm
AppLibraryCustomizer_CFLAGS = -fobjc-arc -fno-modules
AppLibraryCustomizer_FRAMEWORKS = Foundation UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
