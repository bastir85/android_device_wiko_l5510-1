$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/wiko/l5510/l5510-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/wiko/l5510/overlay

LOCAL_PATH := device/wiko/l5510

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_l5510
PRODUCT_DEVICE := l5510
