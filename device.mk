ENABLE_VIRTUAL_AB := true
AB_OTA_UPDATER := true

# =====================================================
# A/B OTA
# =====================================================

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vendor \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor_boot

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# =====================================================
# Debug
# =====================================================

PRODUCT_PACKAGES_DEBUG += \
    bootctrl \
    update_engine_client

# =====================================================
# MTK
# =====================================================

PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# =====================================================
# Boot HAL
# =====================================================

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

# =====================================================
# Health HAL
# =====================================================

PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# =====================================================
# Fastbootd
# =====================================================

PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock

# =====================================================
# OTA
# =====================================================

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_engine_sideload \
    update_verifier

# =====================================================
# Keystore2
# =====================================================

PRODUCT_PACKAGES += \
    android.system.keystore2PRODUCT_PACKAGES += \
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

# Crypto
PRODUCT_PACKAGES += \
    android.system.keystore2

TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.gatekeeper@1.0 \
    android.hardware.keymaster@4.1

# Keymaster (REAL from your dump)
PRODUCT_PACKAGES += \
    libkeymaster4_1support \
    libpuresoftkeymasterdevice \
    android.hardware.keymaster@4.1-service.trustonic \
    android.hardware.gatekeeper@1.0-service
