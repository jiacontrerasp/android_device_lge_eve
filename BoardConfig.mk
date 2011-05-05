#
# Product-specific compile-time definitions.
#

TARGET_BOARD_PLATFORM := msm7k
TARGET_BOARD_PLATFORM_GPU := qcom
TARGET_CPU_ABI := armeabi
TARGET_ARCH_VARIANT := armv6j
TARGET_ARCH_VARIANT_CPU := arm1136j-s

TARGET_BOOTLOADER_BOARD_NAME := eve
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
# recovery.img
TARGET_PREBUILT_RECOVERY_KERNEL := device/lg/eve/kernel
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/lg/eve/recovery/recovery_ui.c

# for OpenEVE kernel
TARGET_OPENEVE := true

ifdef TARGET_OPENEVE
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"
endif

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X

#bcm4329 driver
ifdef TARGET_OPENEVE
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/wireless.ko"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/etc/wl/rtecdc.bin nvram_path=/etc/wl/nvram.txt config_path=/data/misc/wifi/config"
WIFI_DRIVER_MODULE_NAME     := "wireless"
else
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_MODULE_ARG      := "iface_name=wlan0 firmware_path=/etc/wl/rtecdc.bin nvram_path=/etc/wl/nvram.txt"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"
endif

#This would pull in the wrong wpa_supplicant.conf and dhcpcd.conf
BOARD_WLAN_DEVICE           := bcm4329

# enable SoftAP
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wl/rtecdc.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wl/rtecdc-apsta.bin"

BOARD_USES_GENERIC_AUDIO := false
BOARD_USE_HTC_LIBSENSORS := false

# Camera
BOARD_USE_FROYO_LIBCAMERA := true
BOARD_CAMERA_BUILD_FROM_SOURCE := false
BOARD_CAMERA_USE_GETBUFFERINFO := true
BOARD_USES_QCOM_LIBS := true
#BOARD_GL_TEX_POW2_DIMENSION_REQUIRED := true
#BOARD_NO_GL2 := true

# kernel cmdline
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=/dev/null

# bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# FM radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# 2D/3D Graphics
TARGET_HARDWARE_3D := false
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
# Use RGB565 surfaces until userspace drivers are upgraded
BOARD_NO_RGBX_8888 := true
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
#BOARD_HAS_LIMITED_EGL := true

#If this is exacly libloc_api, then it will build from source
BOARD_GPS_LIBRARIES := libloc
BOARD_USES_GPSSHIM := true

#USE_PV_WINDOWS_MEDIA := false
USE_CAMERA_STUB := false

BOARD_EGL_CFG := device/lg/eve/egl.cfg

# USB
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
ifdef TARGET_OPENEVE
# Add LUNFILE configuration to the system
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun"
endif

# old libsensor
#TARGET_USES_OLD_LIBSENSORS_HAL := true

# webkit
JS_ENGINE := v8
# ENABLE_GIF added 
# see external/webkit/Android.mk
ENABLE_GIF_ANIMATION := true
#BOARD_GLOBAL_CFLAGS += -DANDROID_LARGE_MEMORY_DEVICE
