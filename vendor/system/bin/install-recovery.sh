#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7020544 2271af25f12362add12231a4aab216315e07bcc9 4708352 8881af08ce446c38d2f35df0920b60eaa9d4667d
fi

if ! applypatch -c EMMC:/dev/recovery:7020544:2271af25f12362add12231a4aab216315e07bcc9; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/bootimg:4708352:8881af08ce446c38d2f35df0920b60eaa9d4667d EMMC:/dev/recovery 2271af25f12362add12231a4aab216315e07bcc9 7020544 8881af08ce446c38d2f35df0920b60eaa9d4667d:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
