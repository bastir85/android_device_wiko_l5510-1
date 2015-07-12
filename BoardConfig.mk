USE_CAMERA_STUB := true
LOCAL_PATH := device/wiko/l5510

# inherit from the proprietary version
-include vendor/wiko/l5510/BoardConfigVendor.mk

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_VENDOR_COMMON := msm8916_32
TARGET_BOARD_PLATFORM_GPU := qcom-adreno306
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8916
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a53

TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Kernel
BOARD_CUSTOM_BOOTIMG_MK      := $(LOCAL_PATH)/mkbootimg.mk
#TARGET_PREBUILT_KERNEL 	     := $(LOCAL_PATH)/kernel
BOARD_KERNEL_CMDLINE 	     := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 androidboot.selinux=permissive
BOARD_KERNEL_BASE 	     := 0x80000000
BOARD_KERNEL_PAGESIZE 	     := 2048
BOARD_KERNEL_TAGS_OFFSET     := 0x00000100
BOARD_RAMDISK_OFFSET	     := 0x01000000
BOARD_KERNEL_PAGESIZE        := 2048
BOARD_KERNEL_SEPARATED_DT    := true
TARGET_KERNEL_CONFIG 	     := msm8916_l5510_defconfig

# Qualcomm Hardware
BOARD_USES_QCOM_HARDWARE 	:= true
TARGET_USES_ION 		:= true
TARGET_USES_NEW_ION_API 	:= true
TARGET_USES_QCOM_BSP 		:= true
PROTOBUF_SUPPORTED 		:= true

#Add support for firmare upgrade on 8916
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE := true

# Powerhal
TARGET_POWERHAL_VARIANT 	:= qcom

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1702887424
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12936655872
BOARD_CACHEIMAGE_PARTITION_SIZE := 274726912
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072

# SELinux
include device/qcom/sepolicy/selinux.mk

# Recovery
RECOVERY_VARIANT                := twrp
BOARD_HAS_NO_SELECT_BUTTON 	:= true
BOARD_RECOVERY_SWIPE 		:= true
TARGET_RECOVERY_FSTAB 		:= $(LOCAL_PATH)/twrp.fstab
TARGET_RECOVERY_PIXEL_FORMAT 	:= BGRA_8888
TARGET_OTA_ASSERT_DEVICE 	:= l5510,ridge4g
ENABLE_ADB_DIAG_IN_PWROFF_CHARGE := true

# TWRP Flags
DEVICE_RESOLUTION               := 720x1280
RECOVERY_SDCARD_ON_DATA		:= true
TW_BRIGHTNESS_PATH		:= /sys/class/leds/lcd-backlight/brightness
TW_TARGET_USES_QCOM_BSP		:= true
RECOVERY_SDCARD_ON_DATA 	:= true
TW_INTERNAL_STORAGE_PATH 	:= "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
RECOVERY_GRAPHICS_USE_LINELENGTH := true


# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
