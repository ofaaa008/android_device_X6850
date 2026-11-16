#!/system/bin/sh
# Called automatically by TWRP (check_and_run_script) right before
# property_set("sys.powerctl", "reboot,"). Clear the BCB in misc so no stale
# command (boot-recovery / boot-fastboot) is left behind for later boots.

m=/dev/block/bootdevice/by-name/misc
[ -e "$m" ] || m=/dev/block/by-name/misc
[ -e "$m" ] || exit 0

dd if=/dev/zero of="$m" bs=2048 count=1 2>/dev/null
sync
exit 0
