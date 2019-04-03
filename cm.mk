# Release name
PRODUCT_RELEASE_NAME := narnia

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/quanta/narnia/full_narnia.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := narnia
PRODUCT_NAME := cm_narnia
PRODUCT_BRAND := LeapFrog
PRODUCT_MODEL := narnia
PRODUCT_MANUFACTURER := quanta
PRODUCT_RELEASE_NAME := Epic

TARGET_SCREEN_WIDTH := 600
TARGET_SCREEN_HEIGHT := 1024