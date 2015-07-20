$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/qcom/l5320/l5320-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/qcom/l5510/overlay

LOCAL_PATH := device/qcom/l5510

TARGET_USES_QCOM_BSP := true

ifeq ($(TARGET_USES_QCOM_BSP), true)
# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
endif #TARGET_USES_QCOM_BSP

ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/media/media_profiles_8916.xml:system/etc/media_profiles.xml \
                      $(LOCAL_PATH)/media/media_codecs_8916.xml:system/etc/media_codecs.xml
endif

# Feature definition files for msm8916
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml

# QCOM
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcompostprocbundle

$(call inherit-product, device/cyanogen/msm8916-common/msm8916.mk)

PRODUCT_PROPERTY_OVERRIDES += \
       dalvik.vm.heapgrowthlimit=128m \
       ro.sf.lcd_density=300

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/vendor/lib/libqc-opt.so

# BT
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Set this device to DSDS as default.
ADDITIONAL_BUILD_PROPERTIES += persist.radio.multisim.config=dsds

# Listen configuration file
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/listen_platform_info.xml:system/etc/listen_platform_info.xml

$(call inherit-product, build/target/product/full.mk)

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_l5510
PRODUCT_DEVICE := l5510

PRODUCT_LOCALES += en_US ru_RU fr_FR es_ES de_DE pt_PT cs_CZ pl_PL fi_FI hu_HU sk_SK uk_UA ar_EG fa_IR it_IT nl_NL da_DK nb_NO sv_SE
