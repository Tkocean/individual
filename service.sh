#!/system/bin/sh
(
 until [ $(getprop init.svc.bootanim) = "stopped" ]; do
 sleep 3
 done

 echo "PowerManagerService.noSuspend" > /sys/power/wake_lock
 chown 1000:1000 /data/adb/modules/Aurora/config/Aurora.ini && chmod 004 /data/adb/modules/Aurora/config/Aurora.ini && chown 0:0 /system/bin/Aurora && chmod 7110 /system/bin/Aurora && /system/bin/Aurora -n
)&

exit 0