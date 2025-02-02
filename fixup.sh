#!/sbin/sh

model=`cat /proc/cmdline | sed 's/.*HW_ID=\([^ ]*\).*/\1/'`
PF500KL="PF500KL"
A91="A91"

mkdir /asusfw
mount -t ext4 /dev/block/platform/msm_sdcc.1/by-name/asusfw /asusfw

if [[ "$model" == *"$A91"* ]]; then
 cp -R /asusfw/nfc/libpn544_c3_fw.so  /system/vendor/firmware/libpn544_fw.so
else if [[ "$model" == *"$PF500KL"* ]]; then
 cp -R /asusfw/nfc/libpn544_c2_fw.so  /system/vendor/firmware/libpn544_fw.so
fi
fi

umount /data/asusfw
