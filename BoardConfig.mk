#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/portov

# Inherit from motorola sm6450-common
include device/motorola/sm6450-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := portov

# Partitions
BOARD_MOT_DP_GROUP_SIZE := 7511998464 # (BOARD_SUPER_PARTITION_SIZE - 4MB)
BOARD_SUPER_PARTITION_SIZE := 7516192768

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/properties/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/properties/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Security
BOOT_SECURITY_PATCH := 2026-07-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Vintf
ODM_MANIFEST_SKUS += d dn dne
ODM_MANIFEST_D_FILES := $(DEVICE_PATH)/configs/vintf/sku/manifest_d.xml
ODM_MANIFEST_DN_FILES := $(DEVICE_PATH)/configs/vintf/sku/manifest_dn.xml
ODM_MANIFEST_DNE_FILES := $(DEVICE_PATH)/configs/vintf/sku/manifest_dne.xml

DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/configs/vintf/compatibility_matrix_device.xml

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 11
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 11

# inherit from the proprietary version
include vendor/motorola/portov/BoardConfigVendor.mk
