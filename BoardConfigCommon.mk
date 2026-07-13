# ============================================================
# BoardConfigCommon.mk — MT6768 Common Tree
#
# This file is included by each device's BoardConfig.mk.
# Override any of these values BEFORE including this file
# (or after, since := allows override when redefined).
#
# Architecture:   ARM64
# Platform:       MediaTek MT6768 (Helio G80/G85/G88)
# Boot Header:    v4 (GKI-compatible)
# Recovery:       vendor_boot (TWRP)
# Crypto:         FBE v2 + metadata encryption (Trustonic TEE)
# Graphics:       DRM backend
# ============================================================

# ============================================================
# ARCHITECTURE — ARM64
# ============================================================
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true
TARGET_USES_64_BIT_BINDER := true

# ============================================================
# PLATFORM — MediaTek MT6768
# ============================================================
TARGET_BOARD_PLATFORM := mt6768
BOARD_VNDK_VERSION := current
BOARD_USES_MTK_HARDWARE := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
ALLOW_MISSING_DEPENDENCIES := true

# ============================================================
# BOOTLOADER
# ============================================================
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# ============================================================
# KERNEL / GKI
# ============================================================
TARGET_NO_KERNEL := true
BOARD_RAMDISK_USE_LZ4 := true

BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_PAGE_SIZE := 4096
BOARD_TAGS_OFFSET := 0x0bc08000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_HEADER_SIZE := 2128
BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_VENDOR_BASE := 0x40078000
BOARD_KERNEL_SEPARATED_DTBO := true

BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE) --board ""
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# ============================================================
# VENDOR BOOT — GKI vendor_boot recovery
# ============================================================
TARGET_NO_RECOVERY := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_USES_RECOVERY_AS_VENDOR_BOOT := true
BOARD_USES_VENDOR_BOOTIMAGE := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true

# ============================================================
# PARTITIONS — Dynamic super layout
# ============================================================
BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_SUPER_PARTITION_BLOCK_DEVICES := super
BOARD_SUPER_PARTITION_METADATA_DEVICE := super
BOARD_SUPER_PARTITION_GROUPS := main

BOARD_MAIN_PARTITION_LIST += \
    odm_dlkm \
    product \
    system \
    system_ext \
    vendor \
    vendor_dlkm

BOARD_EXT4_SHARE_DUP_BLOCKS := true
BOARD_USES_METADATA_PARTITION := true

# ============================================================
# FILESYSTEM — Primary types (device may override)
# ============================================================
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_ODM_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_ODM_DLKM := odm_dlkm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# ============================================================
# RECOVERY — TWRP settings
# ============================================================
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Security patches
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# ============================================================
# AVB — Verified Boot
# ============================================================
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# ============================================================
# CRYPTO — FBE v2 + Metadata Encryption
# ============================================================
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_USE_FSCRYPT_POLICY := 2
TW_FORCE_KEYMASTER_VER := 4
TW_CRYPTO_USE_SYSTEM_VOLD := true
TW_CRYPTO_SYSTEM_VOLD_DECRYPT := true
TW_CRYPTO_SYSTEM_VOLD_KEY_PATH := "/metadata/vold/metadata_encryption"

# ============================================================
# GRAPHICS — DRM Backend
# ============================================================
TW_GRAPHICS_BACKEND := "drm"
TW_GRAPHICS_FORCE_USE_DRM := true
TW_LOAD_VENDOR_BOOT_MODULES := true

# ============================================================
# USB — MTP, ADB, OTG, Fastbootd
# ============================================================
TW_EXCLUDE_DEFAULT_USB_INIT := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_HAS_NO_RECOVERY_PARTITION := true
TW_USES_OTG_USB := true
TW_HAS_MTP := true

# ============================================================
# STORAGE
# ============================================================
RECOVERY_SDCARD_ON_DATA := true

# ============================================================
# STATUS BAR — Default layout (device may override)
# ============================================================
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := "300"
TW_CUSTOM_CLOCK_POS := "70"
TW_CUSTOM_BATTERY_POS := "790"
TW_CUSTOM_CPU_TEMP_PATH := sys/devices/virtual/thermal/thermal_zone4/temp

# ============================================================
# BRIGHTNESS — Defaults (device may override)
# ============================================================
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200

# ============================================================
# TWRP FEATURES
# ============================================================
TW_FRAMERATE := 60
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_APEX := true
TW_EXCLUDE_TZDATA := true
TW_EXCLUDE_PYTHON := true
TW_EXCLUDE_TWRPAPP := true
TW_NO_FASTBOOT_BOOT := true
TW_NO_LEGACY_PROPS := true
TW_TARGET_USES_MOUNT := true

# TWRP Tools
TW_INCLUDE_FB2PNG := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LPTOOLS := true
TW_INCLUDE_LIBRESETPROP := true
TW_USE_TOOLBOX := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_EXFAT := true
TW_INCLUDE_BASH := true
TW_INCLUDE_SUPERSU := true
TW_INCLUDE_LPDUMP := true
TARGET_USES_MKE2FS := true

# ============================================================
# DEBUG / LOGGING
# ============================================================
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TWRP_EVENT_LOGGING := true

# ============================================================
# ADDITIONAL CONFIG — Device-specific overrides go in BoardConfig.mk
# ============================================================
