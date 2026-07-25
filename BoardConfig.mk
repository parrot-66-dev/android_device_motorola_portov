#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/mona

# Inherit from motorola sm7435-common
include device/motorola/sm7435-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mona

# Partitions
BOARD_MOT_DP_GROUP_SIZE := 10313793536 # (BOARD_SUPER_PARTITION_SIZE - 4MB)
BOARD_SUPER_PARTITION_SIZE := 10317987840

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/properties/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/properties/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Security
BOOT_SECURITY_PATCH := 2026-06-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Vintf
ODM_MANIFEST_SKUS += n dn
ODM_MANIFEST_DN_FILES := $(DEVICE_PATH)/configs/vintf/sku/manifest_dn.xml
ODM_MANIFEST_N_FILES := $(DEVICE_PATH)/configs/vintf/sku/manifest_n.xml

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 18
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 18

# inherit from the proprietary version
include vendor/motorola/mona/BoardConfigVendor.mk
