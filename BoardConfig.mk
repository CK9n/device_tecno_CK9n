#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/tecno/CK9n
KERNEL_PATH := $(DEVICE_PATH)-kernel

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot\
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Bootloader
BOARD_VENDOR := tecno
TARGET_BOOTLOADER_BOARD_NAME := TECNO-CK9n
TARGET_NO_BOOTLOADER := true

# Boot Image
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_DTB_OFFSET := 0x07c08000
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOT_HEADER_VERSION := 2

BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2

# Kernel
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_KERNEL_SOURCE := $(KERNEL_PATH)/kernel-headers

BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_INCLUDE_RECOVERY_DTBO := true

LOCAL_KERNEL := $(KERNEL_PATH)/kernel
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtb
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(KERNEL_PATH)/vendor-modules/*.ko)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072                   # 2048      * 64   (pagesize)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864         # 65536     * 1024 (sdc36)
BOARD_DTBOIMG_PARTITION_SIZE := 8388608            # 8192      * 1024 (sdc39)

# Partitions - Dynamic
BOARD_SUPER_PARTITION_SIZE := 11780751360
BOARD_SUPER_PARTITION_GROUPS := tecno_dynamic_partitions
BOARD_TECNO_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product
BOARD_TECNO_DYNAMIC_PARTITIONS_SIZE := 11780751360

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs

TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Partitions - Metadata
BOARD_USES_METADATA_PARTITION := true

# Platform
TARGET_BOARD_PLATFORM := mt6893
BOARD_HAS_MTK_HARDWARE := true

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6893
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Inherit the proprietary files
include vendor/tecno/CK9n/BoardConfigVendor.mk
