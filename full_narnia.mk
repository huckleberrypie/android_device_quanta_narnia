DEVICE_DIR := device/quanta/narnia

# Inherit from those products. Most specific first.
$(call inherit-product, $(DEVICE_DIR)/device.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_CHARACTERISTICS := tablet

# ramdisk
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/ramdisk,root)

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