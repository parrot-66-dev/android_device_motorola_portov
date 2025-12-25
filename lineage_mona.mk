#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from mona device
$(call inherit-product, device/motorola/mona/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_mona
PRODUCT_DEVICE := mona
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola moto g stylus - 2025

PRODUCT_GMS_CLIENTID_BASE := android-motorola

# TODO: Update build desc when full zip is available

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="mona_g-user 16 W1VA36.62-22-16 ba798b-5a0125 release-keys" \
    BuildFingerprint=motorola/mona_g/msi:16/W1VAS36M-W1-ST15.1/ca2fc5:user/release-keys \
    DeviceProduct=mona_g
