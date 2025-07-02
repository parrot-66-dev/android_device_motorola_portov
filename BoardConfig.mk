# 
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/mona

# A/B
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    product \
    recovery \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot \
    vendor_dlkm

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mona
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
BOARD_KERNEL_PAGESIZE := 0x00001000
BOARD_BOOT_HEADER_VERSION := 4

BOARD_RAMDISK_USE_LZ4 := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.memcg=1 androidboot.usbcontroller=a600000.dwc3 androidboot.load_modules_parallel=true
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)-kernel/kernel
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)-kernel/dtb

BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(DEVICE_PATH)-kernel/vendor/*.ko)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)-kernel/modules.load.vendor))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(DEVICE_PATH)-kernel/vendor_ramdisk/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)-kernel/modules.load.vendor_ramdisk))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)-kernel/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD) $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)

BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)

TARGET_KERNEL_CONFIG := mona
TARGET_KERNEL_SOURCE := $(DEVICE_PATH)-kernel/headers/

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := parrot66

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Security
BOOT_SECURITY_PATCH := 2025-09-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Verified Boot
BOARD_AVB_ROLLBACK_INDEX := 8
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := 8

# Inherit the proprietary files
include vendor/motorola/mona/BoardConfigVendor.mk
