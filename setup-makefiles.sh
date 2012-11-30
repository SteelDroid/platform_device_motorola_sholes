#!/bin/sh
# Copyright (C) 2010 The Android Open Source Project

DEVICE=sholes

mkdir -p ../../../vendor/motorola/$DEVICE

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/motorola/$DEVICE/$DEVICE-vendor.mk
# Copyright (C) 2010 The Android Open Source Project

# This file is generated by device/motorola/__DEVICE__/setup-makefiles.sh

# Live wallpaper packages
PRODUCT_PACKAGES := \\
    LiveWallpapers \\
    LiveWallpapersPicker \\
    MagicSmokeWallpapers \\
    VisualizationWallpapers \\
    librs_jni

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES := \\
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Pick up overlay for features that depend on non-open-source files
DEVICE_PACKAGE_OVERLAYS := vendor/motorola/__DEVICE__/overlay

\$(call inherit-product, vendor/motorola/__DEVICE__/__DEVICE__-vendor-blobs.mk)
EOF

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/motorola/sholes/BoardConfigVendor.mk
# Copyright (C) 2010 The Android Open Source Project

# This file is generated by device/motorola/__DEVICE__/setup-makefiles.sh

BOARD_GPS_LIBRARIES := libmoto_gps

USE_CAMERA_STUB := false
EOF

mkdir -p ../../../vendor/motorola/sholes/overlay/packages/apps/Launcher2/res/layout
(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/motorola/sholes/overlay/packages/apps/Launcher2/res/layout/all_apps.xml
<?xml version="1.0" encoding="utf-8"?>
<!-- Copyright (C) 2009 The Android Open Source Project -->

<!-- This file is generated by device/motorola/__DEVICE__/setup-makefiles.sh -->

<!-- switch to all_apps_3d on devices that support RenderScript -->
<merge xmlns:android="http://schemas.android.com/apk/res/android">
    <include layout="@layout/all_apps_3d" />
</merge>
EOF
