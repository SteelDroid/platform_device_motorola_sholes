# Copyright (C) 2009 The Android Open Source Project

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false
BOARD_USE_FROYO_LIBCAMERA := true
BOARD_USE_YUV422I_DEFAULT_COLORFORMAT := true

# inherit from the proprietary version
-include vendor/motorola/sholes/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := omap3

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8

TARGET_BOOTLOADER_BOARD_NAME := sholes

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libCustomWifi
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := tiwlan0
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/wilink_6_1
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_FIRMWARE_LOADER        := "wlan_loader"

BOARD_USES_GENERIC_AUDIO := false

BOARD_KERNEL_CMDLINE := console=ttyS2,115200n8 rw mem=244M@0x80C00000 init=/init ip=off brdrev=P3A_CDMA mtdparts=omap2-nand.0:640k@128k(mbm),384k@1408k(cdt),384k@3328k(lbl),384k@6272k(misc),3584k(boot),4608k(recovery),143744k(system),94848k(cache),268032k(userdata),2m(kpanic)
BOARD_KERNEL_BASE := 0x10000000

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_EGL_CFG := device/motorola/sholes/egl.cfg

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00380000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x08c60000   # limited so we enforce room to grow
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_SMALL_RECOVERY := true

#TARGET_RECOVERY_UI_LIB := librecovery_ui_sholes librecovery_ui_generic

#TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_generic

USE_SHOLES_PROPERTY := true
TARGET_PREBUILT_KERNEL := device/motorola/sholes/kernel
TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/sholes/recovery_kernel

HARDWARE_OMX := true
BOARD_USES_GPSSHIM := true
BOARD_NO_RGBX_8888 := true
