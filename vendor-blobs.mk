# vendor-blobs.mk
# ============================================================
# Proprietary vendor blobs for TECNO KJ5 (MT6768)
# Auto-generated from firmware dump at dumps.tadiphone.dev
# Android 13 TWRP Recovery — FBE v2 + Trustonic TEE
#
# This file includes the device-vendor.mk (if extracted) and
# defines PRODUCT_COPY_FILES for all proprietary blobs.
#
# To extract blobs from device:  ./extract-files.sh
# ============================================================

$(call inherit-product-if-exists, vendor/tecno/KJ5/device-vendor.mk)

# ============================================================
# MOBICORE / MCDRIVER DAEMON (Trustonic TEE HW interface)
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/bin/mcDriverDaemon:$(TARGET_COPY_OUT_VENDOR)/bin/mcDriverDaemon \
    vendor/tecno/KJ5/proprietary/vendor/bin/kmsetkey_ca.trustonic:$(TARGET_COPY_OUT_VENDOR)/bin/kmsetkey_ca.trustonic \
    vendor/tecno/KJ5/proprietary/vendor/bin/tee:$(TARGET_COPY_OUT_VENDOR)/bin/tee

# ============================================================
# TRUSTONIC TEE STACK
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/bin/hw/vendor.trustonic.tee@1.1-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.trustonic.tee@1.1-service \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libMcClient.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libMcClient.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libTEECommon.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libTEECommon.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.trustonic.tee@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.trustonic.tee@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.trustonic.tee@1.1.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.trustonic.tee@1.1.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.trustonic.tee.tui@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.trustonic.tee.tui@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/kmsetkey.trustonic.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/kmsetkey.trustonic.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/paytrigger.trustonic.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/paytrigger.trustonic.so

# ============================================================
# KEYMASTER 4.1 (Trustonic)
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/bin/hw/android.hardware.keymaster@4.1-service.trustonic:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.keymaster@4.1-service.trustonic \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.keymaster@3.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.keymaster@3.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.keymaster@4.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.keymaster@4.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.keymaster@4.1.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.keymaster@4.1.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libkeymaster41.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libkeymaster41.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libkeymaster4.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libkeymaster4.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libkeymaster4support.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libkeymaster4support.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libkeymaster4_1support.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libkeymaster4_1support.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libpuresoftkeymasterdevice.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libpuresoftkeymasterdevice.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libkeymaster_messages.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libkeymaster_messages.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libkeymaster_portable.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libkeymaster_portable.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libsoft_attestation_cert.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libsoft_attestation_cert.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libcppbor_external.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcppbor_external.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libcppcose_rkp.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcppcose_rkp.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.mediatek.hardware.keymaster_attestation@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.mediatek.hardware.keymaster_attestation@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.mediatek.hardware.keymaster_attestation@1.1.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.mediatek.hardware.keymaster_attestation@1.1.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/vendor.mediatek.hardware.keymaster_attestation@1.1-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/vendor.mediatek.hardware.keymaster_attestation@1.1-impl.so

# ============================================================
# GATEKEEPER (Trustonic)
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/bin/hw/android.hardware.gatekeeper@1.0-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.gatekeeper@1.0-service \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.gatekeeper@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.gatekeeper@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.gatekeeper@1.0-impl.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/libMcGatekeeper.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/libMcGatekeeper.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/libSoftGatekeeper.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/libSoftGatekeeper.so

# ============================================================
# KEYSTORE / WIFI KEYSTORE
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.system.wifi.keystore@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.system.wifi.keystore@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libkeystore-engine-wifi-hidl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libkeystore-engine-wifi-hidl.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libkeystore-wifi-hidl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libkeystore-wifi-hidl.so

# ============================================================
# HEALTH HAL
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/bin/hw/android.hardware.health@2.1-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.health@2.1-service \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.health@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.health@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.health@2.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.health@2.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.health@2.1.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.health@2.1.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/android.hardware.health@2.0-impl-2.1.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.health@2.0-impl-2.1.so

# ============================================================
# BOOT CONTROL HAL (MTK implementation)
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/bin/hw/android.hardware.boot@1.2-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.boot@1.2-service \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.boot@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.boot@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.boot@1.1.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.boot@1.1.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.boot@1.2.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.boot@1.2.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/android.hardware.boot@1.0-impl-1.2-mtkimpl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.boot@1.0-impl-1.2-mtkimpl.so

# ============================================================
# MTK PLATFORM UTILITIES & LIBRARIES
# ============================================================
# NOTE: mtk_plpath_utils is installed via Android.bp + PRODUCT_PACKAGES
# (to /system/bin/). Skipping PRODUCT_COPY_FILES to avoid path conflict.
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libion_mtk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libion_mtk.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/mt6768/libmtk_drvb.so:$(TARGET_COPY_OUT_VENDOR)/lib64/mt6768/libmtk_drvb.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libmtkcutils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libmtkcutils.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libmtkhardware_legacy.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libmtkhardware_legacy.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libmtkutils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libmtkutils.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libmtkproperty.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libmtkproperty.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libbwc.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libbwc.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libgralloc_extra.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libgralloc_extra.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libgralloc_metadata.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libgralloc_metadata.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libgralloctypes_mtk.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libgralloctypes_mtk.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libcomposer_ext.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcomposer_ext.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libhwc2on1adapter.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhwc2on1adapter.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libhwc2onfbadapter.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhwc2onfbadapter.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libgpu_aux.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libgpu_aux.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libcapctrl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcapctrl.so

# ============================================================
# VOLD & STORAGE (vendor fallback)
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/system/system/bin/vold:$(TARGET_COPY_OUT_SYSTEM)/bin/vold \
    vendor/tecno/KJ5/proprietary/system/system/bin/vdc:$(TARGET_COPY_OUT_SYSTEM)/bin/vdc \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libnvram.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libnvram.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libcustom_nvram.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcustom_nvram.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libnvram_sec.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libnvram_sec.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libstorage_otp.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libstorage_otp.so

# ============================================================
# TRANSSION PROPRIETARY LIBRARIES
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libtranlog.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libtranlog.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libTran_Log.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libTran_Log.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.transsion.hardware.tranlog@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.transsion.hardware.tranlog@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.transsion.hardware.tranlogconfig@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.transsion.hardware.tranlogconfig@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.transsion.hardware.security.deviceauthen@2.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.transsion.hardware.security.deviceauthen@2.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.transsion.hardware.security.hap@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.transsion.hardware.security.hap@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.transsion.hardware.security.trancriticalparavfy@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.transsion.hardware.security.trancriticalparavfy@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libTran_mtkPowerAPI.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libTran_mtkPowerAPI.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libtrancrypto.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libtrancrypto.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libdeviceauthen.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdeviceauthen.so

# ============================================================
# GRAPHICS / DISPLAY / DRM
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/hwcomposer.mt6768.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/hwcomposer.mt6768.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/gralloc.default.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/gralloc.default.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/lights.mt6768.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/lights.mt6768.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/vendor.mediatek.hardware.composer_ext@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/vendor.mediatek.hardware.composer_ext@1.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.graphics.composer@2.1.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.graphics.composer@2.1.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.graphics.composer@2.1-resources.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.graphics.composer@2.1-resources.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hardware.light@2.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hardware.light@2.0.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so

# ============================================================
# HIDL CORE INTERFACES (vendor copies for recovery)
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libhidltransport.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhidltransport.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libhwbinder.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhwbinder.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libbinderdebug.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libbinderdebug.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libc++_shared.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libc++_shared.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/android.hidl.allocator@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib64/android.hidl.allocator@1.0.so

# ============================================================
# TRUSTONIC TNE CLIENT LIBRARY
# Required by: mcDriverDaemon (for Trustonic TEE HW interface)
# ============================================================
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libtneclient.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libtneclient.so

# NOTE: Additional vendor HAL service binaries (thermal, vibrator, usb, memtrack,
# mtkpower, nvram) were removed from extraction because they are NOT started
# by init.rc during recovery and had missing vendor dependency libraries.
# Only HALs started by init.recovery.mt6768.rc are included in the tree.

# ============================================================
# VENDOR SELINUX POLICY FILES
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
# ADDITIONAL VENDOR HAL SERVICE BINARIES
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
    vendor/tecno/KJ5/proprietary/vendor/lib64/libwpfa.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libwpfa.so

# ============================================================
# ADDITIONAL VENDOR LIBRARIES (unique entries not duplicated above)
# ============================================================
# NOTE: libnvram.so, libcustom_nvram.so, libnvram_sec.so are in VOLD & STORAGE section above
PRODUCT_COPY_FILES += \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libcrypto-mdapp.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcrypto-mdapp.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libssl-mdapp.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libssl-mdapp.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libdecrypt.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libdecrypt.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libkmsetkey.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libkmsetkey.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/liboemcrypto.so:$(TARGET_COPY_OUT_VENDOR)/lib64/liboemcrypto.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libtlcWidevineModularDrm.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libtlcWidevineModularDrm.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libwvhidl.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libwvhidl.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libgz_gp_client.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libgz_gp_client.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/libgz_uree.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libgz_uree.so \
    vendor/tecno/KJ5/proprietary/vendor/lib64/liburee_meta_drmkeyinstall.so:$(TARGET_COPY_OUT_VENDOR)/lib64/liburee_meta_drmkeyinstall.so
