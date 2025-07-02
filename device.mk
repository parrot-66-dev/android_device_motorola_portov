#
# Copyright (C) 2025 The LineageOS Project
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

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 450dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_module_config_primary.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_module_config_primary.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2712
TARGET_SCREEN_WIDTH := 1220
    
# Fingerprint
PRODUCT_PACKAGES += \
    libshim_fp

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.face-V4-ndk.vendor \
    android.hardware.biometrics.fingerprint-V4-ndk.vendor \
    android.hardware.biometrics.common.util.vendor \
    android.hardware.biometrics.common.thread.vendor
    
PRODUCT_PACKAGES +=\
    libshim_fp

# Init
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/hw/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/bin/*.sh),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/bin/$(notdir $f)))

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResDevice \
    LineageSdkResDevice \
    LineageSystemUIResDevice \
    SystemUIResDevice

# NFC
TARGET_USES_ST_NFC := true

# Screen
TARGET_SCREEN_DENSITY := 450

# Shipping API Level
BOARD_SHIPPING_API_LEVEL := 202404
PRODUCT_SHIPPING_API_LEVEL := 35

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Wi-Fi
TARGET_WIFI_VARIANTS := qca6750

# Inherit from motorola sm7435-common
$(call inherit-product, device/motorola/sm7435-common/common.mk)

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/mona/mona-vendor.mk)
