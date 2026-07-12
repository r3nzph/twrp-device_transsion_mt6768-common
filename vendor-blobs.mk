# vendor-blobs.mk
# ============================================================
# Proprietary vendor blobs for TECNO KJ5 (MT6768)
# Auto-generated from firmware dump at dumps.tadiphone.dev
# Android 13 TWRP Recovery — FBE v2 + Trustonic TEE
#
# IMPORTANT: This file only contains PRODUCT_COPY_FILES for
# blobs NOT already defined as prebuilt modules in Android.bp.
# Files defined in Android.bp are installed via PRODUCT_PACKAGES
# in device.mk and would cause "duplicate files" errors if also
# listed here.
#
# To extract blobs from device:  ./extract-files.sh
# ============================================================

$(call inherit-product-if-exists, vendor/tecno/KJ5/device-vendor.mk)

# ============================================================
# VOLD & STORAGE (vendor fallback)
# NOTE: vold and vdc bin are built from AOSP source via
# PRODUCT_PACKAGES (device.mk).
# libnvram, libcustom_nvram, libnvram_sec are Android.bp modules.
# Only libstorage_otp is unique here.
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libstorage_otp.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libstorage_otp.so

# ============================================================
# MTK PLATFORM UTILITIES — Non-module blobs
# The following are NOT defined in Android.bp:
#   libmtkproperty.so, libgralloc_metadata.so, libgralloctypes_mtk.so,
#   libhwc2on1adapter.so, libhwc2onfbadapter.so
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libmtkproperty.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libmtkproperty.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libgralloc_metadata.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libgralloc_metadata.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libgralloctypes_mtk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libgralloctypes_mtk.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libhwc2on1adapter.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhwc2on1adapter.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libhwc2onfbadapter.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhwc2onfbadapter.so

# ============================================================
# TRANSSION PROPRIETARY — Non-module blobs
# The following are NOT defined in Android.bp:
#   vendor.transsion.hardware.security.*, libdeviceauthen.so
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.transsion.hardware.security.deviceauthen@2.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.transsion.hardware.security.deviceauthen@2.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.transsion.hardware.security.hap@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.transsion.hardware.security.hap@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.transsion.hardware.security.trancriticalparavfy@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.transsion.hardware.security.trancriticalparavfy@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libdeviceauthen.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdeviceauthen.so

# ============================================================
# GRAPHICS / DISPLAY / DRM — Non-module blobs
# The following are NOT defined in Android.bp:
#   android.hardware.graphics.composer@2.1.so,
#   android.hardware.graphics.composer@2.1-resources.so,
#   android.hardware.light@2.0.so,
#   android.hardware.graphics.allocator@4.0-impl-mediatek.so,
#   android.hardware.graphics.mapper@4.0-impl-mediatek.so
# NOTE: hwcomposer.mt6768, gralloc.default, lights.mt6768,
#       composer_ext are Android.bp modules — NOT listed here.
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.graphics.composer@2.1.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.graphics.composer@2.1.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.graphics.composer@2.1-resources.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.graphics.composer@2.1-resources.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.light@2.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.light@2.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so

# ============================================================
# HIDL CORE INTERFACES — Non-module blobs
# Only libbinderdebug.so and libc++_shared.so are NOT in Android.bp.
# libhidltransport, libhwbinder, android.hidl.allocator are modules.
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libbinderdebug.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libbinderdebug.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libc++_shared.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libc++_shared.so

# ============================================================
# VENDOR SELINUX POLICY FILES
# These are NOT defined in Android.bp — all copied via PRODUCT_COPY_FILES.
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/etc/selinux/precompiled_sepolicy:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/precompiled_sepolicy \
    vendor/tecno/KJ5/proprietary/vendor/etc/selinux/plat_sepolicy_vers.txt:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/plat_sepolicy_vers.txt \
    vendor/tecno/KJ5/proprietary/vendor/etc/selinux/vendor_file_contexts:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/vendor_file_contexts \
    vendor/tecno/KJ5/proprietary/vendor/etc/selinux/vendor_property_contexts:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/vendor_property_contexts \
    vendor/tecno/KJ5/proprietary/vendor/etc/selinux/vendor_hwservice_contexts:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/vendor_hwservice_contexts \
    vendor/tecno/KJ5/proprietary/vendor/etc/selinux/vendor_service_contexts:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/vendor_service_contexts \
    vendor/tecno/KJ5/proprietary/vendor/etc/selinux/vndservice_contexts:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/vndservice_contexts \
    vendor/tecno/KJ5/proprietary/vendor/etc/selinux/vendor_seapp_contexts:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/vendor_seapp_contexts \
    vendor/tecno/KJ5/proprietary/vendor/etc/selinux/vendor_sepolicy.cil:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/vendor_sepolicy.cil \
    vendor/tecno/KJ5/proprietary/vendor/etc/selinux/plat_pub_versioned.cil:$(TARGET_COPY_OUT_VENDOR)/etc/selinux/plat_pub_versioned.cil

# ============================================================
# ADDITIONAL VENDOR LIBRARIES (Not in Android.bp)
# All these files are ONLY copied via PRODUCT_COPY_FILES — they have
# no corresponding prebuilt module in Android.bp.
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libged.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libged.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libmmprofile.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libmmprofile.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libmnl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libmnl.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libperfctl_vendor.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libperfctl_vendor.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libpnpmgr.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpnpmgr.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libsysenv.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libsysenv.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libudf.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libudf.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libverno.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libverno.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libvibrator.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libvibrator.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libwifi-hal.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libwifi-hal.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libwpfa.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libwpfa.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libdecrypt.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdecrypt.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libwvhidl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libwvhidl.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/liburee_meta_drmkeyinstall.so:$(TARGET_COPY_OUT_VENDOR)/lib64/liburee_meta_drmkeyinstall.so
