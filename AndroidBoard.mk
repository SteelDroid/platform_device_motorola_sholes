# Copyright (C) 2009 The Android Open Source Project

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# Symlink keysym file that sholes looks for
file := $(TARGET_OUT)/usr/keychars/qtouch-touchscreen.kcm.bin
ALL_PREBUILT += $(file)
$(file) : $(TARGET_OUT)/usr/keychars/qwerty.kcm.bin
	@echo "Symlink: $@ -> qwerty.kcm.bin"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf qwerty.kcm.bin $@

file := $(TARGET_OUT)/usr/keychars/cpcap-key.kcm.bin
ALL_PREBUILT += $(file)
$(file) : $(TARGET_OUT)/usr/keychars/qwerty.kcm.bin
	@echo "Symlink: $@ -> qwerty.kcm.bin"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf qwerty.kcm.bin $@

# include the non-open-source counterpart to this file
-include vendor/motorola/sholes/AndroidBoardVendor.mk
