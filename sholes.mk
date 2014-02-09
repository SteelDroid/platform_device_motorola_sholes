#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic CDMA sholes,
# not specialized for any geography.
#

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to CDMA

PRODUCT_COPY_FILES += \
    device/motorola/sholes/init.sholes.rc:root/init.sholes.rc

## (2) Also get non-open-source CDMA-specific aspects if available
$(call inherit-product-if-exists, vendor/motorola/sholes/sholes-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-CDMA-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.google.clientidbase=android-verizon \
    ro.com.google.locationfeatures=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.cdma.home.operator.numeric=310004 \
    ro.cdma.home.operator.alpha=Verizon \
    ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
    ro.cdma.data_retry_config=default_randomization=2000,0,0,120000,180000,540000,960000 \
    ro.config.vc_call_vol_steps=7 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=3000 \
    ro.url.safetylegal=http://www.motorola.com/staticfiles/Support/legal/?model=A855 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000

DEVICE_PACKAGE_OVERLAYS += device/motorola/sholes/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/motorola/sholes/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    librs_jni \
    dspexec \
    libbridge \
    overlay.omap3 \
    wlan_cu \
    libtiOsLib \
    wlan_loader \
    libCustomWifi \
    dhcpcd.conf \
    libOMX.TI.AAC.encode \
    libOMX.TI.AMR.encode \
    libOMX.TI.WBAMR.encode \
    libOMX.TI.JPEG.Encoder \
    libLCML \
    libOMX_Core \
    libOMX.TI.Video.Decoder \
    libOMX.TI.Video.encoder \
    libVendor_ti_omx \
    gps.sholes \
    sensors.sholes \
    lights.sholes \
    libaudiopolicy

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# sholes uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/motorola/sholes/vold.fstab:system/etc/vold.fstab \
    device/motorola/sholes/apns-conf.xml:system/etc/apns-conf.xml

# All the files necessary for ChevyNo1's included kernel
PRODUCT_COPY_FILES += \
    device/motorola/sholes/chevyno1_kernel/auth_rpcgss.ko:/system/lib/modules/auth_rpcgss.ko \
    device/motorola/sholes/chevyno1_kernel/cifs.ko:/system/lib/modules/cifs.ko \
    device/motorola/sholes/chevyno1_kernel/ext2.ko:/system/lib/modules/ext2.ko \
    device/motorola/sholes/chevyno1_kernel/ext3.ko:/system/lib/modules/ext3.ko \
    device/motorola/sholes/chevyno1_kernel/ext4.ko:/system/lib/modules/ext4.ko \
    device/motorola/sholes/chevyno1_kernel/jbd.ko:/system/lib/modules/jbd.ko \
    device/motorola/sholes/chevyno1_kernel/jbd2.ko:/system/lib/modules/jbd2.ko \
    device/motorola/sholes/chevyno1_kernel/lockd.ko:/system/lib/modules/lockd.ko \
    device/motorola/sholes/chevyno1_kernel/logger.ko:/system/lib/modules/logger.ko \
    device/motorola/sholes/chevyno1_kernel/mbcache.ko:/system/lib/modules/mbcache.ko \
    device/motorola/sholes/chevyno1_kernel/nfs.ko:/system/lib/modules/nfs.ko \
    device/motorola/sholes/chevyno1_kernel/nfs_acl.ko:/system/lib/modules/nfs_acl.ko \
    device/motorola/sholes/chevyno1_kernel/ntfs.ko:/system/lib/modules/ntfs.ko \
    device/motorola/sholes/chevyno1_kernel/ramzswap.ko:/system/lib/modules/ramzswap.ko \
    device/motorola/sholes/chevyno1_kernel/sunrpc.ko:/system/lib/modules/sunrpc.ko \
    device/motorola/sholes/chevyno1_kernel/tiwlan_drv.ko:/system/lib/modules/tiwlan_drv.ko

# Copy kernel wifi extras
PRODUCT_COPY_FILES += \
    device/motorola/sholes/chevyno1_kernel/fw_wlan1271.bin:/system/etc/wifi/fw_wlan1271.bin \
    device/motorola/sholes/chevyno1_kernel/tiwlan.ini:/system/etc/wifi/tiwlan.ini \
    device/motorola/sholes/chevyno1_kernel/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/motorola/sholes/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# copy kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/motorola/sholes/sholes-vendor.mk)

# media profiles and capabilities spec
# $(call inherit-product, device/motorola/sholes/media_a1026.mk)

$(call inherit-product, build/target/product/small_base.mk)

#Add additional locales and set the en_US as default
PRODUCT_DEFAULT_LANGUAGE := en_US

PRODUCT_NAME := generic_sholes
PRODUCT_DEVICE := sholes
