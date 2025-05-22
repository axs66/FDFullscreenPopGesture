TARGET = iphone:clang:latest:10.0
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64 arm64e
PACKAGE_VERSION = 1.0.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FDFullscreenPopGesture

FDFullscreenPopGesture_FILES = Tweak.xm ../FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m
FDFullscreenPopGesture_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
