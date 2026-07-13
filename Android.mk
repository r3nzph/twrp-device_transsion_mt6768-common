#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Common tree makefile for Transsion MT6768 devices
# Included automatically for any device using this common tree.
#

LOCAL_PATH := $(call my-dir)

# The bootctrl prebuilt modules
include $(LOCAL_PATH)/bootctrl/Android.mk
