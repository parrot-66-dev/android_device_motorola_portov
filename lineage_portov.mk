#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from mona device
$(call inherit-product, device/motorola/portov/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_portov
PRODUCT_DEVICE := portov
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola moto g 67 power 5G

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="portov_g-user 16 W1VTS36H.22-20-3-2-3 e5c56a-0049ea release-keys" \
    BuildFingerprint="motorola/portov_g/portov:16/W1VTS36H.22-20-3-2-3/e5c56a-0049ea:user/release-keys" \
    DeviceProduct="portov_g"
