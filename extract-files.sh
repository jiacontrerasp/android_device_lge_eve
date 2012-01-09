#!/bin/bash

VENDOR=lge
DEVICE=eve

DEST=../../../vendor/$VENDOR/$DEVICE
rm -rf $DEST/proprietary
mkdir -p $DEST/proprietary

if [ ! -f $DEST/system/build.prop ]; then
  ADB=adb
  PULL=pull
  SRC=
else
  ADB=cp
  PULL=
  SRC=$DEST/system
fi

#Radio
FILES="lib/liblgdrmwbxml.so lib/liblgdrmxyssl.so lib/libdll.so lib/libril-qcril-hook-oem.so lib/libgsdi_exp.so lib/libgstk_exp.so lib/libwms.so"
FILES="$FILES lib/libnv.so lib/libwmsts.so lib/liblgeat.so lib/libril_log.so lib/liblgerft.so lib/libbcmwl.so lib/liblgdrm.so lib/libwmdrmpd.so"
FILES="$FILES lib/liboem_rapi.so lib/libmmgsdilib.so lib/libcm.so lib/liboncrpc.so lib/libdsm.so lib/libqueue.so"
FILES="$FILES lib/libdiag.so lib/libril-qc-1.so lib/libril.so"
FILES="$FILES lib/libdss.so lib/libqmi.so bin/qmuxd"

#Wifi
FILES="$FILES etc/wl/rtecdc.bin etc/wl/rtecdc-apsta.bin etc/wl/nvram.txt"

#Bluetooth
FILES="$FILES bin/BCM4325D0_004.001.007.0168.0169.hcd bin/btld"

#Camera
FILES="$FILES lib/libmm-qcamera-tgt.so lib/libmmjpeg.so lib/libcamera.so"

#Video
FILES="$FILES lib/libmm-adspsvc.so lib/libOmxH264Dec.so lib/libOmxMpeg4Dec.so lib/libOmxVidEnc.so lib/libOmxWmvDec.so"
FILES="$FILES lib/libomx_aacdec_sharedlibrary.so lib/libomx_amrdec_sharedlibrary.so lib/libomx_amrenc_sharedlibrary.so lib/libomx_avcdec_sharedlibrary.so"
FILES="$FILES lib/libomx_m4vdec_sharedlibrary.so lib/libomx_mp3dec_sharedlibrary.so"
FILES="$FILES lib/libaomx_mp3dec_sharedlibrary.so lib/libaomx_mp4dec_sharedlibrary.so lib/libaomx_wmadec_sharedlibrary.so lib/libaomx_wmvdec_sharedlibrary.so"
# qcomm Video encode/decode
FILES="$FILES lib/libOmxCore.so lib/libmm-omxcore.so lib/libqcomm_omx.so"
# Camera
FILES="$FILES lib/libmmipl.so"

#Sensors
FILES="$FILES bin/akmd2"

#OpenGL
FILES="$FILES lib/egl/libGLES_qcom.so"

#GPS
FILES="$FILES lib/libloc.so lib/libloc-rpc.so lib/libcommondefs.so lib/libloc_api.so lib/libloc_ext.so lib/libgps.so"

for i in $FILES; do
  $ADB $PULL "$SRC/system/$i" $DEST/proprietary || exit 1
done

chmod 755 $DEST/proprietary/akmd2
echo "NOTE: Unless all transfers failed, errors above should be safe to ignore. Proceed with your build"
