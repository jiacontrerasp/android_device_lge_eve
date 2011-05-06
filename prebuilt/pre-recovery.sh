#!/system/bin/sh

RECOVERY="recovery.img gb-recovery.img eve-recovery.img rarecovery.img"
PARTS="/sdcard /cache"

[ ! -x /system/bin/flash_image ] && exit 0

for x in $PARTS; do
	for y in $RECOVERY; do
		if [ -f $x/$y ]; then
			echo "found $x/$y"
			if [ -x /system/bin/flash_image ]; then
				/system/bin/flash_image boot $x/$y
				exit 0
			fi
		fi
	done
done
