# ============================================================
# device.mk — TECNO Spark 20 (KJ5 / MT6768)
# Android 13 / TWRP Recovery
#
# PRODUCT_PACKAGES: Modules built from AOSP source
# TARGET_RECOVERY_DEVICE_MODULES: Linked into recovery binary
# TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES: Relinked libs
# ============================================================

ENABLE_VIRTUAL_AB := true
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    system_ext \
    product \
    vendor \
    vbmeta \
    vendor_boot \
    vbmeta_system \
    vbmeta_vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES_DEBUG += \
    bootctrl \
    update_engine_client

# ============================================================
# (A) CORE RECOVERY BINARIES & DAEMONS
# ============================================================

# --- MTK PlPath Utils (from source) ---
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# --- Vold & Storage ---
PRODUCT_PACKAGES += \
    vold \
    vdc

# --- Keystore ---
PRODUCT_PACKAGES += \
    keystore \
    keystore_auth \
    android.system.keystore2

# --- Fastbootd ---
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock

# --- Update Engine (Virtual A/B) ---
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# ============================================================
# (B) HIDL HAL INTERFACES (AOSP — built from source)
# ============================================================

# Boot Control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0 \
    android.hardware.boot@1.1 \
    android.hardware.boot@1.2

# Boot Control MTK Implementation (built from bootctrl/)
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@1.0 \
    android.hardware.health@2.0 \
    android.hardware.health@2.1 \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Gatekeeper HIDL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0

# Health Storage HIDL (required by vold)
# NOTE: android.hardware.health.storage-V1-ndk, android.security.maintenance-ndk,
# android.system.keystore2-V2-ndk, and security keymint NDK backends are commented
# out because they may not exist in minimal-manifest-twrp 12.1 (added in 12L/13).
PRODUCT_PACKAGES += \
    android.hardware.health.storage@1.0

# Security Keymint HIDL interfaces (HIDL, not NDK — compatible with AOSP 12.1)
# The NDK backends (-V2-ndk) were added in Android 12L/13 and may not be
# available in minimal-manifest-twrp 12.1. Keymaster 4.1 HIDL handles
# the actual key operations.
# PRODUCT_PACKAGES += \
#    android.hardware.security.keymint-V2-ndk \
#    android.hardware.security.secureclock-V1-ndk \
#    android.hardware.security.sharedsecret-V1-ndk

# Keymaster HIDL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0 \
    android.hardware.keymaster@4.0 \
    android.hardware.keymaster@4.1

# ============================================================
# (C) CORE SYSTEM LIBRARIES (AOSP — built from source)
# These must be in the recovery ramdisk for all HAL services
# and for the recovery binary itself.
# ============================================================

PRODUCT_PACKAGES += \
    libhardware \
    libhardware_legacy \
    libhidlbase \
    libhidltransport \
    libhwbinder \
    libutils \
    liblog \
    liblogwrap \
    libbase \
    libcutils \
    libcrypto \
    libssl \
    libz \
    libunwindstack \
    libbacktrace \
    libf2fs \
    libext4 \
    libext4_utils \
    libfscrypt \
    libion \
    libdmctl \
    libgsi \
    libcap \
    libdiskconfig \
    libf2fs_sparseblock \
    libincfs \
    libkeyutils \
    libsysutils \
    libselinux \
    libkeymaster_portable \
    lib_android_keymaster_keymint_utils \
    libcppbor_external \
    libcppcose_rkp \
    libsoft_attestation_cert \
    libkeymint_support \
    libui \
    libgui \
    libsync

# ============================================================
# (D) VENDOR-SPECIFIC PREBUILT MODULES (from Android.bp)
# Auto-generated from firmware dump at dumps.tadiphone.dev
# These are vendor blobs from the stock ROM that require
# corresponding prebuilt module definitions in Android.bp.
# ============================================================

# --- Trustonic TEE Stack ---
PRODUCT_PACKAGES += \
    vendor.trustonic.mcDriverDaemon \
    vendor.trustonic.kmsetkey_ca \
    vendor.trustonic.tee-cmd \
    vendor.trustonic.tee@1.1-service \
    libMcClient \
    libTEECommon \
    vendor.trustonic.tee@1.0 \
    vendor.trustonic.tee@1.1 \
    vendor.trustonic.tee.tui \
    vendor.trustonic.kmsetkey-hw \
    vendor.trustonic.paytrigger-hw

# --- Keymaster 4.1 (Trustonic) ---
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1-service.trustonic \
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
    vendor.mediatek.hardware.keymaster_attestation@1.1-impl

# --- Gatekeeper (Trustonic) ---
PRODUCT_PACKAGES += \
    vendor.gatekeeper.trustonic \
    vendor.android.hardware.gatekeeper@1.0 \
    vendor.gatekeeper.impl \
    libMcGatekeeper \
    libSoftGatekeeper

# --- Keystore ---
PRODUCT_PACKAGES += \
    vendor.android.system.wifi.keystore \
    vendor.libkeystore-engine-wifi-hidl \
    vendor.libkeystore-wifi-hidl

# --- Health HAL ---
PRODUCT_PACKAGES += \
    vendor.android.hardware.health@2.1-service \
    vendor.android.hardware.health@1.0 \
    vendor.android.hardware.health@2.0 \
    vendor.android.hardware.health@2.1 \
    vendor.android.hardware.health@2.0-impl-2.1

# --- Boot Control HAL ---
PRODUCT_PACKAGES += \
    vendor.android.hardware.boot@1.2-service \
    vendor.android.hardware.boot@1.0 \
    vendor.android.hardware.boot@1.1 \
    vendor.android.hardware.boot@1.2 \
    vendor.android.hardware.boot@1.0-impl-1.2-mtkimpl

# --- MTK Platform Libraries ---
PRODUCT_PACKAGES += \
    libion_mtk \
    libmtk_drvb \
    libmtkcutils \
    libmtkhardware_legacy \
    libmtkutils \
    libbwc \
    libgralloc_extra \
    libcomposer_ext \
    libgpu_aux \
    libcapctrl

# --- NVRAM / Storage ---
PRODUCT_PACKAGES += \
    vendor.libnvram \
    vendor.libcustom_nvram \
    vendor.libnvram_sec

# --- Crypto / Security ---
PRODUCT_PACKAGES += \
    vendor.libcrypto_mdapp \
    vendor.libssl_mdapp \
    vendor.libtrancrypto \
    vendor.libkmsetkey

# --- Transsion Proprietary ---
PRODUCT_PACKAGES += \
    libtranlog \
    libTran_Log \
    vendor.transsion.hardware.tranlog \
    vendor.transsion.hardware.tranlogconfig \
    libTran_mtkPowerAPI

# --- Graphics / Display ---
PRODUCT_PACKAGES += \
    vendor.hwcomposer.mt6768 \
    vendor.gralloc.default \
    vendor.lights.mt6768 \
    vendor.mediatek.hardware.composer_ext

# --- HIDL Core (vendor copies) ---
PRODUCT_PACKAGES += \
    vendor.libhidltransport \
    vendor.libhwbinder \
    vendor.android.hidl.allocator@1.0

# --- Trustonic TNE Client ---
PRODUCT_PACKAGES += \
    vendor.libtneclient

# --- Secure World / DRM ---
PRODUCT_PACKAGES += \
    vendor.liboemcrypto \
    vendor.libtlcWidevineModularDrm \
    vendor.libgz_gp_client \
    vendor.libgz_uree

# ============================================================
# (E) RELINK LIBRARIES
# TWRP copies these .so files into the recovery ramdisk for
# runtime symbol resolution.
#
# Paths for AOSP-built libraries (from source):
#   $(TARGET_OUT_SHARED_LIBRARIES)/ = system/lib64
# Paths for vendor prebuilt blobs:
#   $(TARGET_OUT_VENDOR)/lib64/ = vendor/lib64
# ============================================================

# AOSP-built libraries (from system/gatekeeper, system/security/keystore2, etc.)
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper_aidl.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeystore2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libfscrypt.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_portable.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppbor_external.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppcose_rkp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsoft_attestation_cert.so

# Vendor prebuilt libraries (extracted from stock ROM - verified from firmware dump)
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_VENDOR)/lib64/libkeymaster41.so \
    $(TARGET_OUT_VENDOR)/lib64/libkeymaster4.so \
    $(TARGET_OUT_VENDOR)/lib64/libkeymaster4support.so \
    $(TARGET_OUT_VENDOR)/lib64/libkeymaster4_1support.so \
    $(TARGET_OUT_VENDOR)/lib64/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_VENDOR)/lib64/libkeymaster_messages.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.mediatek.hardware.keymaster_attestation@1.0.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.mediatek.hardware.keymaster_attestation@1.1.so \
    $(TARGET_OUT_VENDOR)/lib64/libion_mtk.so \
    $(TARGET_OUT_VENDOR)/lib64/libMcClient.so \
    $(TARGET_OUT_VENDOR)/lib64/libTEECommon.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.trustonic.tee@1.0.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.trustonic.tee@1.1.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.trustonic.tee.tui@1.0.so \
    $(TARGET_OUT_VENDOR)/lib64/libtranlog.so \
    $(TARGET_OUT_VENDOR)/lib64/libTran_Log.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.transsion.hardware.tranlog@1.0.so \
    $(TARGET_OUT_VENDOR)/lib64/vendor.transsion.hardware.tranlogconfig@1.0.so \
    $(TARGET_OUT_VENDOR)/lib64/libTran_mtkPowerAPI.so \
    $(TARGET_OUT_VENDOR)/lib64/libmtkcutils.so \
    $(TARGET_OUT_VENDOR)/lib64/libmtkhardware_legacy.so \
    $(TARGET_OUT_VENDOR)/lib64/libmtkutils.so \
    $(TARGET_OUT_VENDOR)/lib64/libbwc.so \
    $(TARGET_OUT_VENDOR)/lib64/libgralloc_extra.so \
    $(TARGET_OUT_VENDOR)/lib64/libcomposer_ext.so \
    $(TARGET_OUT_VENDOR)/lib64/libgpu_aux.so \
    $(TARGET_OUT_VENDOR)/lib64/libcapctrl.so \
    $(TARGET_OUT_VENDOR)/lib64/libnvram.so \
    $(TARGET_OUT_VENDOR)/lib64/libcustom_nvram.so \
    $(TARGET_OUT_VENDOR)/lib64/libnvram_sec.so \
    $(TARGET_OUT_VENDOR)/lib64/libcrypto-mdapp.so \
    $(TARGET_OUT_VENDOR)/lib64/libssl-mdapp.so \
    $(TARGET_OUT_VENDOR)/lib64/libtrancrypto.so \
    $(TARGET_OUT_VENDOR)/lib64/libkmsetkey.so \
    $(TARGET_OUT_VENDOR)/lib64/liboemcrypto.so \
    $(TARGET_OUT_VENDOR)/lib64/libtlcWidevineModularDrm.so \
    $(TARGET_OUT_VENDOR)/lib64/libgz_gp_client.so \
    $(TARGET_OUT_VENDOR)/lib64/libgz_uree.so

# ============================================================
# (F) RECOVERY DEVICE MODULES
# These modules are linked into the recovery binary for
# symbol resolution. Module names must match either an AOSP
# module or a prebuilt module defined in Android.bp.
# ============================================================

# AOSP modules (built from source)
TARGET_RECOVERY_DEVICE_MODULES += \
    libgatekeeper \
    libgatekeeper_aidl \
    libkeystore2 \
    libfscrypt

# Vendor prebuilt modules (from Android.bp)
# These are linked into the recovery binary for symbol resolution.
# Module names must match Android.bp prebuilt definitions exactly.
TARGET_RECOVERY_DEVICE_MODULES += \
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
    libMcClient \
    libTEECommon \
    vendor.trustonic.tee@1.0 \
    vendor.trustonic.tee@1.1 \
    vendor.trustonic.tee.tui \
    libMcGatekeeper \
    libSoftGatekeeper \
    libion_mtk \
    libmtk_drvb \
    libmtkcutils \
    libmtkhardware_legacy \
    libmtkutils \
    libbwc \
    libgralloc_extra \
    libcomposer_ext \
    libgpu_aux \
    libcapctrl \
    vendor.libnvram \
    vendor.libcustom_nvram \
    vendor.libnvram_sec \
    vendor.libcrypto_mdapp \
    vendor.libssl_mdapp \
    vendor.libtrancrypto \
    vendor.libkmsetkey \
    libtranlog \
    libTran_Log \
    vendor.transsion.hardware.tranlog \
    vendor.transsion.hardware.tranlogconfig \
    libTran_mtkPowerAPI \
    vendor.hwcomposer.mt6768 \
    vendor.gralloc.default \
    vendor.lights.mt6768 \
    vendor.mediatek.hardware.composer_ext \
    vendor.libhidltransport \
    vendor.libhwbinder \
    vendor.liboemcrypto \
    vendor.libtlcWidevineModularDrm \
    vendor.libgz_gp_client \
    vendor.libgz_uree

# McDriver daemon (vendor binary for TEE HW init)
TARGET_RECOVERY_DEVICE_MODULES += \
    vendor.trustonic.mcDriverDaemon
