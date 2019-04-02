## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := narnia

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/quanta/narnia/device_narnia.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := narnia
PRODUCT_NAME := cm_narnia
PRODUCT_BRAND := quanta
PRODUCT_MODEL := narnia
PRODUCT_MANUFACTURER := quanta
