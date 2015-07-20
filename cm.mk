## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := l5510

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/qcom/l5510/device_l5510.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := l5510
PRODUCT_NAME := cm_l5510
PRODUCT_BRAND := wiko
PRODUCT_MODEL := l5510
PRODUCT_MANUFACTURER := wiko
