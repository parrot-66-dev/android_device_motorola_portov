#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 390dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_module_config_primary.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_module_config_primary.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080
    
# Fingerprint
PRODUCT_PACKAGES += \
    libshim_fp

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.face-V4-ndk.vendor \
    android.hardware.biometrics.fingerprint-V3-ndk.vendor \
    android.hardware.biometrics.common.util.vendor \
    android.hardware.biometrics.common.thread.vendor
    
PRODUCT_PACKAGES +=\
    libshim_fp

# FM
TARGET_HAS_FM := true

PRODUCT_PACKAGES += \
    FM2

# Init
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/hw/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/bin/*.sh),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/bin/$(notdir $f)))
        
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.touch.rc:recovery/root/init.recovery.touch.rc

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResDevice \
    LineageSdkResDevice \
    LineageSystemUIResDevice \
    SystemUIResDevice

# NFC
TARGET_USES_ST_NFC := true

# Screen
TARGET_SCREEN_DENSITY := 390

# Shipping API Level
BOARD_SHIPPING_API_LEVEL := 202404
PRODUCT_SHIPPING_API_LEVEL := 35

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Wi-Fi
TARGET_WIFI_VARIANTS := adrastea

# Inherit from motorola sm7435-common
$(call inherit-product, device/motorola/sm7435-common/common.mk)

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/portov/portov-vendor.mk)
