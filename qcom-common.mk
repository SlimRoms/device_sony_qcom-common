# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

COMMON_PATH := device/sony/qcom-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# EGL config
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/config/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/config/media_codecs.xml:system/etc/media_codecs.xml

# QCOM Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer \
    libI420colorconvert

# Omx
PRODUCT_PACKAGES += \
    mm-vdec-omx-test \
    mm-venc-omx-test720p \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libc2dcolorconvert \
    libdashplayer

# Power
PRODUCT_PACKAGES += \
    power.qcom

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    dev.pm.dyn_samplingrate=1

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# OpenGL ES
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    debug.composition.type=dyn \
    debug.mdpcomp.logs=0 \
    debug.egl.recordable.rgba8888=1

# hwcomposer - causes screen blink
#PRODUCT_PROPERTY_OVERRIDES += \
#persist.hwc.mdpcomp.enable=true

# enable HDMI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hdmi.enable=true

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Include non-opensource parts if available
$(call inherit-product-if-exists, vendor/sony/qcom-common/common-vendor.mk)
