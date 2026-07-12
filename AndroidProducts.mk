#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# AndroidProducts.mk — AOSP 12.1 (minimal-manifest-twrp)
#
# $(LOCAL_DIR) is set by the build system to the directory containing
# this file (device/tecno/KJ5). The product makefile path is relative
# to the project root.
#
# PRODUCT_MAKEFILES is the primary mechanism. COMMON_LUNCH_CHOICES
# is deprecated since AOSP 10 but still functional in AOSP 12.1;
# it ensures the product appears in `lunch` menu.
#
# Lunch target:  lunch twrp_KJ5-eng
# Build target:  mka vendorbootimage
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_KJ5.mk

COMMON_LUNCH_CHOICES := \
    twrp_KJ5-eng
