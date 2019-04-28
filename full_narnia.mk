DEVICE_DIR := device/quanta/narnia

# Inherit from those products. Most specific first.
$(call inherit-product, $(DEVICE_DIR)/device.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_CHARACTERISTICS := tablet

# ramdisk
#PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/ramdisk,root)
PRODUCT_COPY_FILES += \
    $(DEVICE_DIR)/ramdisk/init.charging.rc:root/init.charging.rc \
    $(DEVICE_DIR)/ramdisk/init.mt8127.rc:root/init.mt8127.rc \
    $(DEVICE_DIR)/ramdisk/init.mt8127usb.rc:root/init.mt8127usb.rc \
    $(DEVICE_DIR)/ramdisk/init.project.rc:root/init.project.rc \
    $(DEVICE_DIR)/ramdisk/init.ssd.rc:root/init.ssd.rc \
    $(DEVICE_DIR)/ramdisk/ueventd.mt8127.rc:root/ueventd.mt8127.rc \
    $(DEVICE_DIR)/ramdisk/enableswap.sh:root/enableswap.sh

# fstab
PRODUCT_COPY_FILES += \
    $(DEVICE_DIR)/ramdisk/fstab.mt8127:root/fstab.mt8127

# sh	# Is there an other way to avoid "- exec '/system/bin/sh' failed: No such file or directory (2) -" ?
PRODUCT_COPY_FILES += \
    $(DEVICE_DIR)/ramdisk/system/bin/sh:root/system/bin/sh

# libxlog
PRODUCT_PACKAGES += \
    libxlog
    
# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf
PRODUCT_COPY_FILES += \
    $(DEVICE_DIR)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(DEVICE_DIR)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(DEVICE_DIR)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

	
# libbt-vendor
PRODUCT_PACKAGES += \
    libbt-vendor

# libdashplayer # ?
#PRODUCT_PACKAGES += \
#    libdashplayer