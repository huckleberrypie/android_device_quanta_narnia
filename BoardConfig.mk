USE_CAMERA_STUB := true

DEVICE_DIR := device/quanta/narnia
VENDOR_DIR := vendor/quanta/narnia
#KERNEL_DIR := kernel/quanta/narnia

# Additional includes
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_DIR)/include

# inherit from the proprietary version
-include $(VENDOR_DIR)/BoardConfigVendor.mk

# Platform
TARGET_BOARD_PLATFORM := mt8127
TARGET_BOARD_PLATFORM_GPU := mali-450mp4

# Arch
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true

TARGET_NO_BOOTLOADER := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_BOOTLOADER_BOARD_NAME := narnia

BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216          # = 16MB  (OK with MTKDroidTools value)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216		# = 16MB  (OK with MTKDroidTools value)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472		# = 3 GB  (OK with MTKDroidTools value)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10908336128	# = 10 GB (OK with MTKDroidTools value)
BOARD_CACHEIMAGE_PARTITION_SIZE := 1073741824		# = 0x07e00000 = 128MB
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file

# Kernel
BOARD_MKBOOTIMG_ARGS := --cmdline "$(BOARD_KERNEL_CMDLINE)" --base 10000000 --pagesize 2048 --kernel_offset 00008000 --ramdisk_offset 01000000 --tags_offset 00000100
BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_CMDLINE := enforcing=0 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_CUSTOM_BOOTIMG_MK := device/quanta/narnia/mkbootimg.mk

BUILD_KERNEL_FROM_SOURCE := false
ifeq ($(BUILD_KERNEL_FROM_SOURCE),true)
    # build kernel from sources
    BOARD_USES_MTK_KERNELBUILD := true    # from https://gitlab.com/SaberMod/slim-android-build/blob/d0ea96c4ec309e9361f8da6d12dc6770f04e57f4/core/mtk_utils.mk
    TARGET_KERNEL_SOURCE := $(KERNEL_DIR)
    TARGET_KERNEL_CONFIG := bitland8127_tb_l_defconfig
    #TARGET_KMODULES := true         # is it needed ?
else
    # use prebuilt kernel
    TARGET_PREBUILT_KERNEL := $(DEVICE_DIR)/kernel
endif

# MTK
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
BLOCK_BASED_OTA :=false

# to be used with hardware/mediatek repo
BOARD_HAS_MTK := true
MTK_HWC_CHIP := mt8127
MTK_HWC_SUPPORT := true
#MTK_WFD_SUPPORT := true
MTK_PQ_SUPPORT := true
MTK_ION_SUPPORT := true
MTK_HDMI_SUPPORT := false
#MTK_SENSOR_SUPPORT := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -DMTK_HARDWARE -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE
COMMON_GLOBAL_CFLAGS += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(DEVICE_DIR)/configs/egl.cfg
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_OVERLAY := true
TARGET_USES_ION := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 1024*1024
BOARD_EGL_NEEDS_HANDLE_VALUE := true

# Surfaceflinger optimization for VD surfaces
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# WIFI
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# BT (added 03/10/2016)
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_DIR)/bluetooth

# RECOVERY
TARGET_RECOVERY_FSTAB := $(DEVICE_DIR)/recovery/root/recovery.fstab
TARGET_RECOVERY_INITRC := $(DEVICE_DIR)/recovery/root/init.rc

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# libxlog
TARGET_LDPRELOAD += libxlog.so

# SELinux
BOARD_SEPOLICY_DIRS := \
       $(DEVICE_DIR)/sepolicy

BOARD_SEPOLICY_UNION += \
    aee_core_forwarder.te \
    attributes \
    bootanim.te \
    device.te \
    file_contexts \
    init.te \
    netd.te \
    platform_app.te \
    service.te \
    service_contexts \
    servicemanager.te \
    surfaceflinger.te \
    sysinit.te \
    system_app.te \
    system_server.te \
    untrusted_app.te \
    zygote.te

BOARD_SEPOLICY_REPLACE += \
    domain.te


# Shims
TARGET_LD_SHIM_LIBS := \
/system/lib/egl/libEGL_mali.so|libshim_egl.so \
/system/lib/hw/hwcomposer.mt8127.so|libshim_hwc.so
