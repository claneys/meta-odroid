ODROIDXU-UBOOT-CONFIG

# U-Boot Parameters
setenv initrd_high "0xffffffff"
setenv fdt_high "0xffffffff"

# Mac address configuration
setenv macaddr "00:1e:06:61:7a:39"

# --------------------------------
setenv bootrootfs "console=tty1 console=ttySAC2,115200n8 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait noinitrd"

# boot commands
setenv bootcmd "fatload mmc 0:1 0x40008000 zImage; fatload mmc 0:1 0x44000000 exynos5422-odroidxu3.dtb; bootz 0x40008000 - 0x44000000"

# --- Screen Configuration for HDMI --- # 
# ---------------------------------------
# Uncomment only ONE line! Leave all commented for automatic selection.
# Uncomment only the setenv line!
# ---------------------------------------
# ODROID-VU forced resolution
# setenv videoconfig "video=HDMI-A-1:1280x800@60"
# -----------------------------------------------
# 1920x1080 (1080P) with monitor provided EDID information. (1080p-edid)
# setenv videoconfig "video=HDMI-A-1:1920x1080@60"
# -----------------------------------------------
# 1920x1080 (1080P) without monitor data using generic information (1080p-noedid)
# setenv videoconfig "drm_kms_helper.edid_firmware=edid/1920x1080.bin"
# -----------------------------------------------
# 1280x720 (720P) with monitor provided EDID information. (720p-edid)
# setenv videoconfig "video=HDMI-A-1:1280x720@60"
# -----------------------------------------------
# 1280x720 (720P) without monitor data using generic information (720p-noedid)
# setenv videoconfig "drm_kms_helper.edid_firmware=edid/1280x720.bin"
# -----------------------------------------------
# 1024x768 without monitor data using generic information
# setenv videoconfig "drm_kms_helper.edid_firmware=edid/1024x768.bin"


# final boot args
setenv bootargs "${bootrootfs} ${videoconfig} smsc95xx.macaddr=${macaddr}"
# drm.debug=0xff
# Boot the board
boot
