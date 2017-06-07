INSTALL_TARGET_PROCESSES = SpringBoard

include theos/makefiles/common.mk

BUNDLE_NAME = ChromeOpener
ChromeOpener_FILES = ChromeOpenerHandler.m
ChromeOpener_INSTALL_PATH = /Library/Opener
ChromeOpener_FRAMEWORKS = UIKit
ChromeOpener_EXTRA_FRAMEWORKS = Opener

include $(THEOS_MAKE_PATH)/bundle.mk
