LOCAL_PATH := $(call my-dir)

file := $(TARGET_ROOT_OUT)/init.eve.rc
$(file) : $(LOCAL_PATH)/prebuilt/init.eve.rc | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)

file := $(TARGET_ROOT_OUT_SBIN)/choosesystem
$(file) : $(LOCAL_PATH)/prebuilt/choosesystem | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)

file := $(TARGET_ROOT_OUT)/initlogo.rle
$(file) : $(LOCAL_PATH)/prebuilt/initlogo.rle | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)

file := $(TARGET_ROOT_OUT)/ueventd.eve.rc
$(file) : $(LOCAL_PATH)/prebuilt/ueventd.eve.rc | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)

file := $(TARGET_ROOT_OUT)/sbin/pre-recovery.sh
$(file) : $(LOCAL_PATH)/prebuilt/pre-recovery.sh | $(ACP)
	$(transform-prebuilt-to-target)
ALL_PREBUILT += $(file)

$(call add-radio-file,recovery/images/firmware_install.565)
$(call add-radio-file,recovery/images/firmware_error.565)
$(call add-radio-file,recovery/images/bitmap_size.txt)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := eve_qwerty.kcm
LOCAL_MODULE_TAGS := eng
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := eve_qwerty_gw620.kcm
LOCAL_MODULE_TAGS := eng
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := eve_qwerty_azerty.kcm
LOCAL_MODULE_TAGS := eng
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := eve_qwerty_qwertz.kcm
LOCAL_MODULE_TAGS := eng
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := eve_qwerty_arabic.kcm
LOCAL_MODULE_TAGS := eng
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := eve_qwerty_russian.kcm
LOCAL_MODULE_TAGS := eng
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE := vold.fstab
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := eng
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libmm-adspsvc.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := ../../../vendor/lge/eve/proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
LOCAL_MODULE_TAGS := eng
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libcommondefs.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := ../../../vendor/lge/eve/proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
LOCAL_MODULE_TAGS := eng
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libloc-rpc.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := ../../../vendor/lge/eve/proprietary/$(LOCAL_MODULE) $(TARGET_OUT_INTERMEDIATE_LIBRARIES)/libcommondefs.so
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
LOCAL_MODULE_TAGS := eng
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libloc.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
#Only the first file is copied, the other are deps
LOCAL_SRC_FILES := ../../../vendor/lge/eve/proprietary/$(LOCAL_MODULE) $(TARGET_OUT_INTERMEDIATE_LIBRARIES)/libloc-rpc.so
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
LOCAL_MODULE_TAGS := eng
include $(BUILD_PREBUILT)

ifeq ($(BOARD_CAMERA_BUILD_FROM_SOURCE),false)
include $(CLEAR_VARS)
LOCAL_MODULE := libcamera.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := ../../../vendor/lge/eve/proprietary/$(LOCAL_MODULE)
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
LOCAL_MODULE_TAGS := eng
include $(BUILD_PREBUILT)
endif

include $(CLEAR_VARS)
LOCAL_MODULE := libril.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := ../../../vendor/lge/eve/proprietary/$(LOCAL_MODULE) $(TARGET_OUT_INTERMEDIATE_LIBRARIES)/libhardware_legacy.so
OVERRIDE_BUILT_MODULE_PATH := $(TARGET_OUT_INTERMEDIATE_LIBRARIES)
LOCAL_MODULE_TAGS := eng
include $(BUILD_PREBUILT)

PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml \
	device/lge/eve/prebuilt/15checkgapps:system/etc/init.d/15checkgapps \
	device/lge/eve/prebuilt/eve_qwerty.kl:system/usr/keylayout/eve_qwerty.kl \
	device/lge/eve/prebuilt/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
	device/lge/eve/prebuilt/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/lge/eve/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/lge/eve/prebuilt/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
	device/lge/eve/prebuilt/gps.conf:system/etc/gps.conf

# Input device calibration files
PRODUCT_COPY_FILES += \
	device/lge/eve/msm_touchscreen.idc:system/usr/idc/msm_touchscreen.idc

PRODUCT_COPY_FILES += \
	device/lge/eve/spn-conf.xml:system/etc/spn-conf.xml
#Radio
PROPRIETARY := lib/liblgdrmwbxml.so lib/liblgdrmxyssl.so lib/libdll.so \
	lib/libril-qcril-hook-oem.so lib/libgsdi_exp.so lib/libgstk_exp.so lib/libwms.so \
	lib/libnv.so lib/libwmsts.so lib/liblgeat.so lib/libril_log.so lib/liblgerft.so \
	lib/libbcmwl.so lib/liblgdrm.so lib/libwmdrmpd.so \
	lib/liboem_rapi.so lib/libdss.so lib/libqmi.so lib/libmmgsdilib.so \
	lib/libcm.so lib/liboncrpc.so lib/libdsm.so lib/libqueue.so \
	lib/libril-qc-1.so lib/libdiag.so bin/qmuxd
#Wifi
PROPRIETARY += etc/wl/rtecdc.bin etc/wl/rtecdc-apsta.bin etc/wl/nvram.txt

#Bluetooth
PROPRIETARY += bin/BCM4325D0_004.001.007.0168.0169.hcd bin/btld

#OpenGL
PROPRIETARY += lib/egl/libGLES_qcom.so

#Video decoder/encoder
PROPRIETARY += \
	lib/libOmxMpeg4Dec.so \
	lib/libOmxH264Dec.so \
	lib/libOmxWmvDec.so \
	lib/libOmxVidEnc.so

#qcom OmxCore for encoder/decoder
PROPRIETARY += \
	lib/libOmxCore.so \
	lib/libmm-omxcore.so

#OpenCore decoder/encoder (not used)
PROPRIETARY += \
	lib/libomx_aacdec_sharedlibrary.so lib/libomx_amrdec_sharedlibrary.so \
	lib/libomx_amrenc_sharedlibrary.so lib/libomx_avcdec_sharedlibrary.so \
	lib/libomx_m4vdec_sharedlibrary.so lib/libomx_mp3dec_sharedlibrary.so

#Arcsoft extension OpenCore decoder/encoder (not used)
PROPRIETARY += \
	lib/libaomx_mp3dec_sharedlibrary.so lib/libaomx_mp4dec_sharedlibrary.so \
	lib/libaomx_wmadec_sharedlibrary.so lib/libaomx_wmvdec_sharedlibrary.so

# qcom Omx
PROPRIETARY += lib/libqcomm_omx.so

#Camera
PROPRIETARY += lib/libmmipl.so

#Sensors
PROPRIETARY += bin/akmd2

#Camera
PROPRIETARY += lib/libmm-qcamera-tgt.so lib/libmmjpeg.so

#GPS
PROPRIETARY += lib/libloc_api.so lib/libloc_ext.so lib/libgps.so

PRODUCT_COPY_FILES += $(foreach i,$(PROPRIETARY),vendor/lge/eve/proprietary/$(notdir $i):system/$i)
