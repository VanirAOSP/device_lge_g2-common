#
# Copyright (C) 2013 The Android Open-Source Project
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
#

# This file includes all definitions that apply to ALL g2-common devices, and
# are also specific to g2-common devices
#
# Everything in this directory will become public

PRODUCT_COPY_FILES += \
    device/lge/g2-common/rootdir/init.g2.rc:root/init.g2.rc \
    device/lge/g2-common/rootdir/init.g2.usb.rc:root/init.g2.usb.rc \
    device/lge/g2-common/rootdir/fstab.g2:root/fstab.g2 \
    device/lge/g2-common/rootdir/ueventd.g2.rc:root/ueventd.g2.rc

# Prebuilt input device calibration files
PRODUCT_COPY_FILES += \
    device/lge/g2-common/input/touch_dev.idc:system/usr/idc/touch_dev.idc

PRODUCT_COPY_FILES += \
    device/lge/g2-common/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/lge/g2-common/configs/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/lge/g2-common/configs/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/lge/g2-common/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/lge/g2-common/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    device/lge/g2-common/configs/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

# kernel tweaks
PRODUCT_COPY_FILES += \
    device/lge/g2-common/configs/00_frandom:system/etc/init.d/00_frandom \
    device/lge/g2-common/configs/99mpdecRenamer:system/etc/init.d/99mpdecRenamer

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(LOCAL_PATH)/nfc/nfcee_access_debug.xml
endif

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

PRODUCT_COPY_FILES += \
    device/lge/g2-common/configs/thermal-engine-msm8974.conf:system/etc/thermal-engine.conf

PRODUCT_TAGS += dalvik.gc.type-precise

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_CHARACTERISTICS := nosdcard

DEVICE_PACKAGE_OVERLAYS := \
    device/lge/g2-common/overlay

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni

# Graphics
PRODUCT_PACKAGES += \
    libgenlock \
    liboverlay \
    hwcomposer.msm8974 \
    gralloc.msm8974 \
    copybit.msm8974 \
    memtrack.msm8974

PRODUCT_PACKAGES += \
    hwaddrs

PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libstagefrighthw \
    libOmxCore \
    libmm-omxcore \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libdashplayer \
    qcmediaplayer

# Hardware codecs
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.hw.aac.encoder=true

PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    debug.composition.type=gpu \
    debug.enable.wl_log=1 \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0 \
    debug.qctwa.statusbar=1 \
    debug.qctwa.preservebuf=1 \
    debug.qc.hardware=true \
    com.qc.hardware=true

PRODUCT_PACKAGES += \
    audio.primary.msm8974 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors

PRODUCT_PACKAGES += \
    libqomx_core \
    libmmcamera_interface \
    libmmjpeg_interface \
    camera.g2 \
    mm-jpeg-interface-test \
    mm-qcamera-app

# GPS configuration
PRODUCT_COPY_FILES += \
    device/lge/g2-common/configs/gps.conf:system/etc/gps.conf \
    device/lge/g2-common/configs/izat.conf:system/etc/izat.conf \
    device/lge/g2-common/configs/sec_config:system/etc/sec_config 

# GPS
PRODUCT_PACKAGES += \
    libloc_adapter

# powerhal
PRODUCT_PACKAGES += \
    power.msm8974

# NFC packages
PRODUCT_PACKAGES += \
    Tag \
    com.android.nfc_extras

PRODUCT_PACKAGES += \
    libion

PRODUCT_PACKAGES += \
    lights.g2

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

# for off charging mode
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# msm_rng entropy feeder
PRODUCT_PACKAGES += \
    qrngd \
    qrngp

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=72 \
    ro.hwui.layer_cache_size=48 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.path_cache_size=32 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.loki_enabled=1 \

# This hw ships locked, work around it with loki
PRODUCT_PACKAGES += \
    loki.sh \
    loki_patch \
    loki_flash \
    loki_unpatch

PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/data/misc/bdaddr

# Set sensor streaming rate
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sensors.max_geomag_rotvec=60 \
    ro.qc.sensors.max_gyro_rate=200 \
    ro.qc.sensors.max_accel_rate=200 \
    ro.qc.sensors.max_grav=200 \
    ro.qc.sensors.max_rotvec=200 \
    ro.qc.sensors.max_ortn=200 \
    ro.qc.sensors.max_linacc=200 \
    ro.qc.sensors.max_gamerv_rate=200

# Enable optional sensor types
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.sensors.smd=true \
    ro.qualcomm.sensors.game_rv=true \
    ro.qualcomm.sensors.georv=true \
    ro.qc.sensors.smgr_mag_cal_en=true \
    ro.qc.sensors.step_detector=true \
    ro.qc.sensors.step_counter=true

# Enable some debug messages by default
PRODUCT_PROPERTY_OVERRIDES += \
    debug.qualcomm.sns.hal=w \
    debug.qualcomm.sns.daemon=w \
    debug.qualcomm.sns.libsensor1=w

# Ril 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=0 \
    ro.telephony.ril_class=LgeLteRIL \
    ro.telephony.ril.v3=qcomdsds

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# props for the MM modules
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-scan=true \
    mmp.enable.3g2=true \
    mm.enable.smoothstreaming=true

# Smoothness Tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    windowsmgr.max_events_per_sec=300 \
    debug.performance.tuning=1 \
    video.accelerate.hw=1 \
    ro.max.fling_velocity=12000 \
    ro.min.fling_velocity=8000 \
    ro.config.disable.hw_accel=false \
    persist.sys.ui.hw=1

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.mode_pref_nv10=1

# update 1x signal strength after 2s
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.radio.snapshot_enabled=1 \
    persist.radio.snapshot_timer=2 \
    persist.radio.add_power_save=1 \
    persist.radio.use_cc_names=true

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.audio.fluencetype=fluencepro \
    persist.audio.fluence.mode=endfire \
    persist.audio.handset.mic=digital \
    persist.audio.voicecall.mic=0 \
    persist.audio.voice.clarity=none \
    persist.audio.aanc.enable=false \
    persist.audio.handset_rx_type=DEFAULT \
    persist.audio.nsenabled=ON \
    persist.speaker.prot.enable=false \
    persist.audio.spkcall_2mic=OFF \
    af.resampler.quality=255 \
    audio.offload.buffer.size.kb=32 \
    audio.offload.gapless.enabled=false \
    av.offload.enable=true \
    audio.offload.min.duration.secs=30 \
    ro.config.vc_call_vol_steps=12 \
    ro.config.vc_call_vol_default=8

# for powerhal
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/vendor/lib/libqc-opt.so

# Setup custom emergency number list based on the MCC. This is needed by RIL
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.custom_ecc=1

# set default USB configuration
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Request modem to send PLMN name always irrespective
# of display condition in EFSPN.
# RIL uses this property.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.always_send_plmn=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib/libril-qc-qmi-1.so

# Input resampling configuration
PRODUCT_PROPERTY_OVERRIDES += \
    ro.input.noresample=1

# Dexopt system to /cache
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=0

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product-if-exists, hardware/qcom/msm8x74/msm8x74.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
