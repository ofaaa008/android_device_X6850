#!/system/bin/sh
# Called automatically by TWRP (check_and_run_script) right before
# property_set("sys.powerctl", "reboot,recovery").
#
# Observed on X6850: after the Rama982 kernel update the bootloader no longer
# acts on the kernel reboot reason "recovery" (Reboot -> Recovery lands in
# system). R11.3 used the identical mechanism, so the ramdisk is not at fault.
# As a fallback for bootloaders that DO read the BCB, stamp a proper AOSP
# bootloader_message with command "boot-recovery" into misc:
#   magic[8]@0 "boot-ind", status[32]@8, command[32]@40, recovery[768]@72.

m=/dev/block/bootdevice/by-name/misc
[ -e "$m" ] || m=/dev/block/by-name/misc
[ -e "$m" ] || exit 0

printf 'boot-ind' | dd of="$m" bs=1 seek=0 conv=notrunc 2>/dev/null
printf 'boot-recovery' | dd of="$m" bs=1 seek=40 conv=notrunc 2>/dev/null
printf 'recovery\n' | dd of="$m" bs=1 seek=72 conv=notrunc 2>/dev/null
sync
exit 0
