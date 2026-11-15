# TWRP Device Tree for Infinix-X6850
- Infinix NOTE 40 PRO 4G

## Device specifications

- Device: Infinix-X6850
- Board: mt6789
- Platform: mtk
- Android version: 31

## Features

- Works with vendor_boot
- Dynamic partitions: True

## Local changes (ofaaa008 fork)

- `recovery/root/lib/modules/modules.load.recovery`: load the touchscreen drivers
  (`adaptive-ts.ko`, `focaltech_ft3683g.ko`, `gt9916_common.ko`). They exist in
  `/lib/modules` but were never loaded in recovery, which is why touch was dead.
- `vendorsetup.sh`: `OF_SCREEN_H` corrected to `2436` (real panel is 1080x2436) and
  the haptics patch path fixed to `device/infinix/X6850`.
- `BoardConfig.mk`: `BOARD_DTB_SIZE` synced with the actual `prebuilt/dtb.img` (208711).
