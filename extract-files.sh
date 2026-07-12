#!/bin/bash
#
# extract-files.sh
# ============================================================
# Extract proprietary vendor blobs from TECNO Spark 20 (KJ5)
# for TWRP Recovery with FBE + metadata decryption support.
#
# Auto-generated from firmware dump at dumps.tadiphone.dev
# Android 13 — Trustonic TEE — FBE v2
#
# Usage:
#   ./extract-files.sh                    # Pull from connected device via ADB
#   ./extract-files.sh <vendor_dir>       # Pull from extracted firmware dump directory
#
# Prerequisites:
#   - ADB connection to device (if pulling via ADB)
#   - OR: extracted firmware dump directory with vendor/, system/ subdirs
# ============================================================

set -e

VENDOR_NAME="tecno"
DEVICE_NAME="KJ5"
PLATFORM="mt6768"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
VENDOR_BASE="${SCRIPT_DIR}/vendor/${VENDOR_NAME}/${DEVICE_NAME}/proprietary"

# Source directory for blobs
if [ -n "$1" ]; then
    SRC_DIR="$1"
    echo "[*] Extracting from directory: ${SRC_DIR}"
elif command -v adb &>/dev/null && adb get-state 2>/dev/null | grep -q device; then
    echo "[*] Extracting from connected ADB device"
    ADB_TMP=$(mktemp -d)
    SRC_DIR="${ADB_TMP}"
    USE_ADB=true
else
    echo "[!] Error: No source specified and no ADB device connected."
    echo "    Usage: $0 [path_to_firmware_dump_root]"
    echo "    Example: $0 /tmp/kj5-dump"
    exit 1
fi

echo "[*] Output directory: ${VENDOR_BASE}"

# ============================================================
# FILE LIST — Auto-generated from firmware dump
# ============================================================
declare -A BLOB_MAP

# --- Section 0: MOBICORE / MCDRIVER (Trustonic TEE HW init) ---
BLOB_MAP["vendor/bin/mcDriverDaemon"]="vendor/bin/mcDriverDaemon"
BLOB_MAP["vendor/bin/kmsetkey_ca.trustonic"]="vendor/bin/kmsetkey_ca.trustonic"
BLOB_MAP["vendor/bin/tee"]="vendor/bin/tee"

# --- Section 1: TRUSTONIC TEE STACK ---
BLOB_MAP["vendor/bin/hw/vendor.trustonic.tee@1.1-service"]="vendor/bin/hw/vendor.trustonic.tee@1.1-service"
BLOB_MAP["vendor/lib64/libMcClient.so"]="vendor/lib64/libMcClient.so"
BLOB_MAP["vendor/lib64/libTEECommon.so"]="vendor/lib64/libTEECommon.so"
BLOB_MAP["vendor/lib64/vendor.trustonic.tee@1.0.so"]="vendor/lib64/vendor.trustonic.tee@1.0.so"
BLOB_MAP["vendor/lib64/vendor.trustonic.tee@1.1.so"]="vendor/lib64/vendor.trustonic.tee@1.1.so"
BLOB_MAP["vendor/lib64/vendor.trustonic.tee.tui@1.0.so"]="vendor/lib64/vendor.trustonic.tee.tui@1.0.so"
BLOB_MAP["vendor/lib64/hw/kmsetkey.trustonic.so"]="vendor/lib64/hw/kmsetkey.trustonic.so"
BLOB_MAP["vendor/lib64/hw/paytrigger.trustonic.so"]="vendor/lib64/hw/paytrigger.trustonic.so"

# --- Section 2: KEYMASTER 4.1 (Trustonic) ---
BLOB_MAP["vendor/bin/hw/android.hardware.keymaster@4.1-service.trustonic"]="vendor/bin/hw/android.hardware.keymaster@4.1-service.trustonic"
BLOB_MAP["vendor/lib64/android.hardware.keymaster@3.0.so"]="vendor/lib64/android.hardware.keymaster@3.0.so"
BLOB_MAP["vendor/lib64/android.hardware.keymaster@4.0.so"]="vendor/lib64/android.hardware.keymaster@4.0.so"
BLOB_MAP["vendor/lib64/android.hardware.keymaster@4.1.so"]="vendor/lib64/android.hardware.keymaster@4.1.so"
BLOB_MAP["vendor/lib64/libkeymaster41.so"]="vendor/lib64/libkeymaster41.so"
BLOB_MAP["vendor/lib64/libkeymaster4.so"]="vendor/lib64/libkeymaster4.so"
BLOB_MAP["vendor/lib64/libkeymaster4support.so"]="vendor/lib64/libkeymaster4support.so"
BLOB_MAP["vendor/lib64/libkeymaster4_1support.so"]="vendor/lib64/libkeymaster4_1support.so"
BLOB_MAP["vendor/lib64/libpuresoftkeymasterdevice.so"]="vendor/lib64/libpuresoftkeymasterdevice.so"
BLOB_MAP["vendor/lib64/libkeymaster_messages.so"]="vendor/lib64/libkeymaster_messages.so"
BLOB_MAP["vendor/lib64/libkeymaster_portable.so"]="vendor/lib64/libkeymaster_portable.so"
BLOB_MAP["vendor/lib64/libsoft_attestation_cert.so"]="vendor/lib64/libsoft_attestation_cert.so"
BLOB_MAP["vendor/lib64/libcppbor_external.so"]="vendor/lib64/libcppbor_external.so"
BLOB_MAP["vendor/lib64/libcppcose_rkp.so"]="vendor/lib64/libcppcose_rkp.so"
BLOB_MAP["vendor/lib64/vendor.mediatek.hardware.keymaster_attestation@1.0.so"]="vendor/lib64/vendor.mediatek.hardware.keymaster_attestation@1.0.so"
BLOB_MAP["vendor/lib64/vendor.mediatek.hardware.keymaster_attestation@1.1.so"]="vendor/lib64/vendor.mediatek.hardware.keymaster_attestation@1.1.so"
BLOB_MAP["vendor/lib64/hw/vendor.mediatek.hardware.keymaster_attestation@1.1-impl.so"]="vendor/lib64/hw/vendor.mediatek.hardware.keymaster_attestation@1.1-impl.so"

# --- Section 3: GATEKEEPER (Trustonic) ---
BLOB_MAP["vendor/bin/hw/android.hardware.gatekeeper@1.0-service"]="vendor/bin/hw/android.hardware.gatekeeper@1.0-service"
BLOB_MAP["vendor/lib64/android.hardware.gatekeeper@1.0.so"]="vendor/lib64/android.hardware.gatekeeper@1.0.so"
BLOB_MAP["vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so"]="vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so"
BLOB_MAP["vendor/lib64/hw/libMcGatekeeper.so"]="vendor/lib64/hw/libMcGatekeeper.so"
BLOB_MAP["vendor/lib64/hw/libSoftGatekeeper.so"]="vendor/lib64/hw/libSoftGatekeeper.so"

# --- Section 4: KEYSTORE ---
BLOB_MAP["vendor/lib64/android.system.wifi.keystore@1.0.so"]="vendor/lib64/android.system.wifi.keystore@1.0.so"
BLOB_MAP["vendor/lib64/libkeystore-engine-wifi-hidl.so"]="vendor/lib64/libkeystore-engine-wifi-hidl.so"
BLOB_MAP["vendor/lib64/libkeystore-wifi-hidl.so"]="vendor/lib64/libkeystore-wifi-hidl.so"

# --- Section 5: HEALTH HAL ---
BLOB_MAP["vendor/bin/hw/android.hardware.health@2.1-service"]="vendor/bin/hw/android.hardware.health@2.1-service"
BLOB_MAP["vendor/lib64/android.hardware.health@1.0.so"]="vendor/lib64/android.hardware.health@1.0.so"
BLOB_MAP["vendor/lib64/android.hardware.health@2.0.so"]="vendor/lib64/android.hardware.health@2.0.so"
BLOB_MAP["vendor/lib64/android.hardware.health@2.1.so"]="vendor/lib64/android.hardware.health@2.1.so"
BLOB_MAP["vendor/lib64/hw/android.hardware.health@2.0-impl-2.1.so"]="vendor/lib64/hw/android.hardware.health@2.0-impl-2.1.so"

# --- Section 6: BOOT CONTROL HAL (MTK) ---
BLOB_MAP["vendor/bin/hw/android.hardware.boot@1.2-service"]="vendor/bin/hw/android.hardware.boot@1.2-service"
BLOB_MAP["vendor/lib64/android.hardware.boot@1.0.so"]="vendor/lib64/android.hardware.boot@1.0.so"
BLOB_MAP["vendor/lib64/android.hardware.boot@1.1.so"]="vendor/lib64/android.hardware.boot@1.1.so"
BLOB_MAP["vendor/lib64/android.hardware.boot@1.2.so"]="vendor/lib64/android.hardware.boot@1.2.so"
BLOB_MAP["vendor/lib64/hw/android.hardware.boot@1.0-impl-1.2-mtkimpl.so"]="vendor/lib64/hw/android.hardware.boot@1.0-impl-1.2-mtkimpl.so"

# --- Section 7: MTK PLATFORM UTILITIES ---
BLOB_MAP["system/system/bin/mtk_plpath_utils"]="system/system/bin/mtk_plpath_utils"
BLOB_MAP["vendor/lib64/libion_mtk.so"]="vendor/lib64/libion_mtk.so"
BLOB_MAP["vendor/lib64/mt6768/libmtk_drvb.so"]="vendor/lib64/mt6768/libmtk_drvb.so"
BLOB_MAP["vendor/lib64/libmtkcutils.so"]="vendor/lib64/libmtkcutils.so"
BLOB_MAP["vendor/lib64/libmtkhardware_legacy.so"]="vendor/lib64/libmtkhardware_legacy.so"
BLOB_MAP["vendor/lib64/libmtkutils.so"]="vendor/lib64/libmtkutils.so"
BLOB_MAP["vendor/lib64/libmtkproperty.so"]="vendor/lib64/libmtkproperty.so"
BLOB_MAP["vendor/lib64/libbwc.so"]="vendor/lib64/libbwc.so"
BLOB_MAP["vendor/lib64/libgralloc_extra.so"]="vendor/lib64/libgralloc_extra.so"
BLOB_MAP["vendor/lib64/libgralloc_metadata.so"]="vendor/lib64/libgralloc_metadata.so"
BLOB_MAP["vendor/lib64/libgralloctypes_mtk.so"]="vendor/lib64/libgralloctypes_mtk.so"
BLOB_MAP["vendor/lib64/libcomposer_ext.so"]="vendor/lib64/libcomposer_ext.so"
BLOB_MAP["vendor/lib64/libhwc2on1adapter.so"]="vendor/lib64/libhwc2on1adapter.so"
BLOB_MAP["vendor/lib64/libhwc2onfbadapter.so"]="vendor/lib64/libhwc2onfbadapter.so"
BLOB_MAP["vendor/lib64/libgpu_aux.so"]="vendor/lib64/libgpu_aux.so"
BLOB_MAP["vendor/lib64/libcapctrl.so"]="vendor/lib64/libcapctrl.so"

# --- Section 8: VOLD & STORAGE (vendor fallback) ---
BLOB_MAP["system/system/bin/vold"]="system/system/bin/vold"
BLOB_MAP["system/system/bin/vdc"]="system/system/bin/vdc"
BLOB_MAP["vendor/lib64/libnvram.so"]="vendor/lib64/libnvram.so"
BLOB_MAP["vendor/lib64/libcustom_nvram.so"]="vendor/lib64/libcustom_nvram.so"
BLOB_MAP["vendor/lib64/libnvram_sec.so"]="vendor/lib64/libnvram_sec.so"
BLOB_MAP["vendor/lib64/libstorage_otp.so"]="vendor/lib64/libstorage_otp.so"

# --- Section 9: FSCRYPT / CRYPTO ---
BLOB_MAP["vendor/lib64/libcrypto-mdapp.so"]="vendor/lib64/libcrypto-mdapp.so"
BLOB_MAP["vendor/lib64/libssl-mdapp.so"]="vendor/lib64/libssl-mdapp.so"
BLOB_MAP["vendor/lib64/libtrancrypto.so"]="vendor/lib64/libtrancrypto.so"
BLOB_MAP["vendor/lib64/libdecrypt.so"]="vendor/lib64/libdecrypt.so"
BLOB_MAP["vendor/lib64/libkmsetkey.so"]="vendor/lib64/libkmsetkey.so"
BLOB_MAP["vendor/lib64/liboemcrypto.so"]="vendor/lib64/liboemcrypto.so"
BLOB_MAP["vendor/lib64/libtlcWidevineModularDrm.so"]="vendor/lib64/libtlcWidevineModularDrm.so"
BLOB_MAP["vendor/lib64/libwvhidl.so"]="vendor/lib64/libwvhidl.so"

# --- Section 10: TRANSSION PROPRIETARY ---
BLOB_MAP["vendor/lib64/libtranlog.so"]="vendor/lib64/libtranlog.so"
BLOB_MAP["vendor/lib64/libTran_Log.so"]="vendor/lib64/libTran_Log.so"
BLOB_MAP["vendor/lib64/vendor.transsion.hardware.tranlog@1.0.so"]="vendor/lib64/vendor.transsion.hardware.tranlog@1.0.so"
BLOB_MAP["vendor/lib64/vendor.transsion.hardware.tranlogconfig@1.0.so"]="vendor/lib64/vendor.transsion.hardware.tranlogconfig@1.0.so"
BLOB_MAP["vendor/lib64/vendor.transsion.hardware.security.deviceauthen@2.0.so"]="vendor/lib64/vendor.transsion.hardware.security.deviceauthen@2.0.so"
BLOB_MAP["vendor/lib64/vendor.transsion.hardware.security.hap@1.0.so"]="vendor/lib64/vendor.transsion.hardware.security.hap@1.0.so"
BLOB_MAP["vendor/lib64/vendor.transsion.hardware.security.trancriticalparavfy@1.0.so"]="vendor/lib64/vendor.transsion.hardware.security.trancriticalparavfy@1.0.so"
BLOB_MAP["vendor/lib64/libTran_mtkPowerAPI.so"]="vendor/lib64/libTran_mtkPowerAPI.so"
BLOB_MAP["vendor/lib64/libtrancrypto.so"]="vendor/lib64/libtrancrypto.so"
BLOB_MAP["vendor/lib64/libdeviceauthen.so"]="vendor/lib64/libdeviceauthen.so"

# --- Section 11: GRAPHICS / DISPLAY / DRM ---
BLOB_MAP["vendor/lib64/hw/hwcomposer.mt6768.so"]="vendor/lib64/hw/hwcomposer.mt6768.so"
BLOB_MAP["vendor/lib64/hw/gralloc.default.so"]="vendor/lib64/hw/gralloc.default.so"
BLOB_MAP["vendor/lib64/hw/lights.mt6768.so"]="vendor/lib64/hw/lights.mt6768.so"
BLOB_MAP["vendor/lib64/vendor.mediatek.hardware.composer_ext@1.0.so"]="vendor/lib64/vendor.mediatek.hardware.composer_ext@1.0.so"
BLOB_MAP["vendor/lib64/android.hardware.graphics.composer@2.1.so"]="vendor/lib64/android.hardware.graphics.composer@2.1.so"
BLOB_MAP["vendor/lib64/android.hardware.graphics.composer@2.1-resources.so"]="vendor/lib64/android.hardware.graphics.composer@2.1-resources.so"
BLOB_MAP["vendor/lib64/android.hardware.light@2.0.so"]="vendor/lib64/android.hardware.light@2.0.so"
BLOB_MAP["vendor/lib64/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so"]="vendor/lib64/hw/android.hardware.graphics.allocator@4.0-impl-mediatek.so"
BLOB_MAP["vendor/lib64/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so"]="vendor/lib64/hw/android.hardware.graphics.mapper@4.0-impl-mediatek.so"

# --- Section 12: HIDL CORE INTERFACES ---
BLOB_MAP["vendor/lib64/libhidltransport.so"]="vendor/lib64/libhidltransport.so"
BLOB_MAP["vendor/lib64/libhwbinder.so"]="vendor/lib64/libhwbinder.so"
BLOB_MAP["vendor/lib64/libbinderdebug.so"]="vendor/lib64/libbinderdebug.so"
BLOB_MAP["vendor/lib64/libc++_shared.so"]="vendor/lib64/libc++_shared.so"

# --- Section 13: ADDITIONAL VENDOR LIBRARIES ---
BLOB_MAP["vendor/lib64/android.hidl.allocator@1.0.so"]="vendor/lib64/android.hidl.allocator@1.0.so"
BLOB_MAP["vendor/lib64/libtneclient.so"]="vendor/lib64/libtneclient.so"

# --- Section 12c: VENDOR SELINUX POLICY FILES ---
BLOB_MAP["vendor/etc/selinux/precompiled_sepolicy"]="vendor/etc/selinux/precompiled_sepolicy"
BLOB_MAP["vendor/etc/selinux/plat_sepolicy_vers.txt"]="vendor/etc/selinux/plat_sepolicy_vers.txt"
BLOB_MAP["vendor/etc/selinux/vendor_file_contexts"]="vendor/etc/selinux/vendor_file_contexts"
BLOB_MAP["vendor/etc/selinux/vendor_property_contexts"]="vendor/etc/selinux/vendor_property_contexts"
BLOB_MAP["vendor/etc/selinux/vendor_hwservice_contexts"]="vendor/etc/selinux/vendor_hwservice_contexts"
BLOB_MAP["vendor/etc/selinux/vendor_service_contexts"]="vendor/etc/selinux/vendor_service_contexts"
BLOB_MAP["vendor/etc/selinux/vndservice_contexts"]="vendor/etc/selinux/vndservice_contexts"
BLOB_MAP["vendor/etc/selinux/vendor_seapp_contexts"]="vendor/etc/selinux/vendor_seapp_contexts"
BLOB_MAP["vendor/etc/selinux/vendor_sepolicy.cil"]="vendor/etc/selinux/vendor_sepolicy.cil"
BLOB_MAP["vendor/etc/selinux/plat_pub_versioned.cil"]="vendor/etc/selinux/plat_pub_versioned.cil"

# --- Section 13: ADDITIONAL VENDOR LIBRARIES ---
BLOB_MAP["vendor/lib64/libgz_gp_client.so"]="vendor/lib64/libgz_gp_client.so"
BLOB_MAP["vendor/lib64/libgz_uree.so"]="vendor/lib64/libgz_uree.so"
BLOB_MAP["vendor/lib64/liburee_meta_drmkeyinstall.so"]="vendor/lib64/liburee_meta_drmkeyinstall.so"
BLOB_MAP["vendor/lib64/libged.so"]="vendor/lib64/libged.so"
BLOB_MAP["vendor/lib64/libmnl.so"]="vendor/lib64/libmnl.so"
BLOB_MAP["vendor/lib64/libmmprofile.so"]="vendor/lib64/libmmprofile.so"
BLOB_MAP["vendor/lib64/libperfctl_vendor.so"]="vendor/lib64/libperfctl_vendor.so"
BLOB_MAP["vendor/lib64/libpnpmgr.so"]="vendor/lib64/libpnpmgr.so"
BLOB_MAP["vendor/lib64/libsysenv.so"]="vendor/lib64/libsysenv.so"
BLOB_MAP["vendor/lib64/libudf.so"]="vendor/lib64/libudf.so"
BLOB_MAP["vendor/lib64/libverno.so"]="vendor/lib64/libverno.so"
BLOB_MAP["vendor/lib64/libvibrator.so"]="vendor/lib64/libvibrator.so"
BLOB_MAP["vendor/lib64/libwifi-hal.so"]="vendor/lib64/libwifi-hal.so"
BLOB_MAP["vendor/lib64/libwpfa.so"]="vendor/lib64/libwpfa.so"

# --- Section 14: ADDITIONAL VENDOR HAL BINARIES ---
# NOTE: Non-essential HAL binaries (thermal, vibrator, usb, memtrack,
# mtkpower, nvram) were removed from extraction because they are NOT
# started by init.rc during recovery and had missing vendor deps.

# ============================================================
# EXTRACTION FUNCTIONS
# ============================================================

pull_file() {
    local src_path="$1"
    local dest_path="$2"
    local dest_dir=$(dirname "${dest_path}")

    mkdir -p "${dest_dir}"

    if [ "${USE_ADB}" = "true" ]; then
        echo "  [ADB] pulling: ${src_path}"
        if adb pull "${src_path}" "${dest_path}" 2>/dev/null; then
            return 0
        fi
        local alt_src="/${src_path}"
        if adb pull "${alt_src}" "${dest_path}" 2>/dev/null; then
            return 0
        fi
        echo "  [!] Warning: could not pull ${src_path}"
        return 1
    else
        # Try multiple path variations
        local full_src="${SRC_DIR}/${src_path}"
        if [ -f "${full_src}" ]; then
            echo "  [COPY] ${full_src}"
            cp "${full_src}" "${dest_path}"
            return 0
        fi
        # Try without system/system prefix
        local alt_src="${SRC_DIR}/${src_path#system/system/}"
        if [ -f "${alt_src}" ]; then
            echo "  [COPY] ${alt_src}"
            cp "${alt_src}" "${dest_path}"
            return 0
        fi
        # Try alternate relative paths
        alt_src="${SRC_DIR}/vendor/${src_path#vendor/}"
        if [ -f "${alt_src}" ]; then
            echo "  [COPY] ${alt_src}"
            cp "${alt_src}" "${dest_path}"
            return 0
        fi
        # Try with absolute path prefix
        alt_src="${SRC_DIR}/${src_path#vendor/}"
        if [ -f "${alt_src}" ]; then
            echo "  [COPY] ${alt_src}"
            cp "${alt_src}" "${dest_path}"
            return 0
        fi
        echo "  [!] Warning: not found at ${full_src}"
        return 1
    fi
}

# ============================================================
# MAIN EXTRACTION
# ============================================================

echo ""
echo "============================================================"
echo " Extracting proprietary blobs for ${DEVICE_NAME} (${PLATFORM})"
echo " Destination: ${VENDOR_BASE}"
echo "============================================================"
echo ""

# Clear existing blobs
rm -rf "${VENDOR_BASE}"/*
echo "[*] Cleared existing blobs"

# Pull each blob
SUCCESS=0
FAILED=0
TOTAL=${#BLOB_MAP[@]}
for src_path in "${!BLOB_MAP[@]}"; do
    dest_path="${VENDOR_BASE}/${BLOB_MAP[$src_path]}"
    if pull_file "${src_path}" "${dest_path}"; then
        SUCCESS=$((SUCCESS + 1))
    else
        FAILED=$((FAILED + 1))
    fi
done

echo ""
echo "============================================================"
echo " Extraction complete!"
echo "   Total blobs:          ${TOTAL}"
echo "   Successfully extracted: ${SUCCESS}"
echo "   Failed/missing:         ${FAILED}"
echo "============================================================"

if [ "${FAILED}" -gt 0 ]; then
    echo ""
    echo "[!] Some blobs could not be found."
    echo "    The build will still work — missing blobs can be"
    echo "    obtained from a full firmware dump."
    echo ""
    echo "    To extract from a firmware dump:"
    echo "      $0 /path/to/firmware_dump_root"
    echo ""
fi

# Clean up temp directory
if [ -n "${ADB_TMP}" ]; then
    rm -rf "${ADB_TMP}"
fi

exit 0
