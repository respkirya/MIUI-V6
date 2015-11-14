#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 12324864 0a783af57412e22b3eadedd6d164d07db9ecec5b 10067968 f99087901236f02d0225cc029a7b31e0f043c9ec
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:12324864:0a783af57412e22b3eadedd6d164d07db9ecec5b; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:10067968:f99087901236f02d0225cc029a7b31e0f043c9ec EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 0a783af57412e22b3eadedd6d164d07db9ecec5b 12324864 f99087901236f02d0225cc029a7b31e0f043c9ec:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
