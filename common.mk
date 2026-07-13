#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enable Virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)


ENABLE_VIRTUAL_AB := true
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    lk \
    odm \
    odm_dlkm \
    product \
    system \
    system_ext \
    vbmeta_system \
    vbmeta_vendor \
    vendor \
    vendor_boot \
    vendor_dlkm

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES_DEBUG += \
    bootctrl \
    update_engine_client

PRODUCT_PROPERTY_OVERRIDES += ro.twrp.vendor_boot=true

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# API
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_TARGET_VNDK_VERSION := 31

# MTK PlPath Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# Health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Bootctrl
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock


# Keystore2
PRODUCT_PACKAGES += \
    android.system.keystore2

# Update Engine
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# ============================================================
# TRUSTONIC TEE STACK (vendor prebuilts from stock firmware)
# Prebuilt module definitions in bootctrl/Android.bp
# ============================================================

# TEE Binaries
PRODUCT_PACKAGES += \
    vendor.trustonic.mcDriverDaemon \
    vendor.trustonic.kmsetkey_ca \
    vendor.trustonic.tee-cmd \
    vendor.trustonic.tee@1.1-service \
    android.hardware.keymaster@4.1-service.trustonic \
    vendor.gatekeeper.trustonic \
    vendor.mediatek.hardware.keymaster_attestation@1.1-service

# TEE Libraries
PRODUCT_PACKAGES += \
    libMcClient \
    libTEECommon \
    vendor.trustonic.tee@1.0 \
    vendor.trustonic.tee@1.1 \
    vendor.trustonic.tee.tui \
    vendor.trustonic.kmsetkey-hw \
    vendor.trustonic.paytrigger-hw \
    vendor.android.hardware.keymaster@3.0 \
    vendor.android.hardware.keymaster@4.0 \
    vendor.android.hardware.keymaster@4.1 \
    libkeymaster41 \
    libkeymaster4 \
    libkeymaster4support \
    libkeymaster4_1support \
    libpuresoftkeymasterdevice \
    libkeymaster_messages \
    libkeymaster_portable \
    libsoft_attestation_cert \
    libcppbor_external \
    libcppcose_rkp \
    vendor.mediatek.hardware.keymaster_attestation@1.0 \
    vendor.mediatek.hardware.keymaster_attestation@1.1 \
    vendor.mediatek.hardware.keymaster_attestation@1.1-impl \
    vendor.android.hardware.gatekeeper@1.0 \
    vendor.gatekeeper.impl \
    libMcGatekeeper \
    libSoftGatekeeper \
    vendor.libtneclient \
    vendor.libtranlog \
    vendor.libcrypto_mdapp \
    vendor.libhidltransport \
    vendor.android.hidl.allocator@1.0

# ============================================================
# McREGISTRY DRIVER BINARIES (.drbin files for mcDriverDaemon)
# Copied from stock vendor/app/mcRegistry/ to:
#   recovery/root/vendor/app/mcRegistry/*.drbin (16 files)
# These are loaded at runtime by mcDriverDaemon via -r flags.
# The recovery/root/ overlay mechanism includes them in the
# vendor_boot ramdisk automatically via BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT.
# No build system registration needed for overlay files.
# ============================================================


# Additional configs
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper_aidl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libgatekeeper \
    libgatekeeper_aidl \
    libkeymaster41 \
    libpuresoftkeymasterdevice
