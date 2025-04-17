#
# Copyright (C) 2022 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nokia/apollo

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := apollo
TARGET_NO_BOOTLOADER := true

# Kernel
TARGET_NO_KERNEL := false
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_RAMDISK_USE_LZ4 := true
BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image

# Platform
TARGET_BOARD_PLATFORM := holi
TARGET_BOARD_PLATFORM_GPU := qcom-adreno619
QCOM_BOARD_PLATFORMS +=holi

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partition Info
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_USES_PRODUCTIMAGE := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 4096
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

BOARD_SUPER_PARTITION_SIZE := 9529458688
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 4764729344 # BOARD_SUPER_PARTITION_SIZE/2 - 4MB
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := product system system_ext vendor

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Props
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# QCOM encryption and decryption
BOARD_USES_QCOM_FBE_DECRYPTION := true
PLATFORM_VERSION := 16.1.0
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Recovery
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_USES_MKE2FS := true

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so

# TWRP
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone50/temp"
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_QCOM_ATS_OFFSET := 1621580431500
TW_DEFAULT_BRIGHTNESS := 1024
TW_MAX_BRIGHTNESS := 3072
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true
TW_H_OFFSET := -115
TW_Y_OFFSET := 115
TW_NO_EXFAT_FUSE := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_LOAD_VENDOR_MODULES := "adapter_class.ko \
        adsp_loader_dlkm.ko \
        apr_dlkm.ko \
        awinic_8622x.ko \
        bolero_cdc_dlkm.ko \
        bq2560x.ko \
        bt_fm_slim.ko \
        btpower.ko \
        camera.ko \
        cdsp-loader.ko \
        cdsprm.ko \
        charger_class.ko \
        chinoe-charger-manager.ko \
        clk-aop-qmp.ko \
        clk-rpmh.ko \
        clk-spmi-pmic-div.ko \
        cmd-db.ko \
        cne_chg_type_det.ko \
        cne_pd_adapter.ko \
        cnss_nl.ko \
        cnss_prealloc.ko \
        cnss_utils.ko \
        core_hang_detect.ko \
        cpucp-l3.ko \
        cx_ipeak.ko \
        device_management_service_v01.ko \
        dispcc-blair.ko \
        dispcc-holi.ko \
        dwc3-haps.ko \
        dwc3.ko \
        dwc3-msm.ko \
        dwc3-of-simple.ko \
        dwc3-qcom.ko \
        ehset.ko \
        eud.ko \
        fixed.ko \
        fpsensor.ko \
        frpc-adsprpc.ko \
        ft8720_fts.ko \
        glink_pkt.ko \
        glink_probe.ko \
        governor_gpubw_mon.ko \
        governor_msm_adreno_tz.ko \
        gpi.ko \
        gpio_keys.ko \
        gpucc-blair.ko \
        gpucc-holi.ko \
        gsim.ko \
        i2c-msm-geni.ko \
        icnss2.ko \
        incrementalfs.ko \
        ipa_clientsm.ko \
        ipa_fmwk.ko \
        ipam.ko \
        leds-aw2016.ko \
        leds-qpnp-flash-v2.ko \
        leds-qpnp-vibrator-ldo.ko \
        leds-qti-tri-led.ko \
        leds-sunlight.ko \
        lvstest.ko \
        m2m-deinterlace.ko \
        machine_dlkm.ko \
        mbhc_dlkm.ko \
        microdump_collector.ko \
        msm-cvp.ko \
        msm_dma_iommu_mapping.ko \
        msm_drm.ko \
        msm-geni-se.ko \
        msm_geni_serial.ko \
        msm_glink_ssr.ko \
        msm_ion_heaps.ko \
        msm_kgsl.ko \
        msm_performance.ko \
        msm_qmp.ko \
        msm_rng.ko \
        msm_sharedmem.ko \
        msm-vidc.ko \
        native_dlkm.ko \
        ns.ko \
        nvmem_qfprom.ko \
        peripheral-loader.ko \
        phy-generic.ko \
        phy-msm-qusb.ko \
        phy-msm-qusb-v2.ko \
        phy-msm-snps-hs.ko \
        phy-msm-ssusb-qmp.ko \
        phy-qcom-emu.ko \
        phy-qcom-ufs-qmp-14nm.ko \
        phy-qcom-ufs-qmp-v3-660.ko \
        phy-qcom-ufs-qmp-v4.ko \
        phy-qcom-ufs-qmp-v4-lahaina.ko \
        pinctrl_lpi_dlkm.ko \
        pinctrl-spmi-gpio.ko \
        pinctrl-spmi-mpp.ko \
        platform_dlkm.ko \
        policy_engine.ko \
        pwm-qti-lpg.ko \
        q6_dlkm.ko \
        q6_notifier_dlkm.ko \
        q6_pdr_dlkm.ko \
        qca_cld3_wlan.ko \
        qce50.ko \
        qcedev-mod.ko \
        qcom-cpufreq-hw.ko \
        qcom_glink_spss.ko \
        qcom-i2c-pmic.ko \
        qcom_pm8008-regulator.ko \
        qcom_proxy_of_consumer.ko \
        qcom-qpnp-qg.ko \
        qcom_rpmh.ko \
        qcom-smb1355-charger.ko \
        qcom-smb1398-charger.ko \
        qcom_soc_wdt.ko \
        qcom-spmi-adc5.ko \
        qcom-spmi-pmic.ko \
        qcom-spmi-sdam.ko \
        qcom-spmi-temp-alarm.ko \
        qcom-spmi-wled.ko \
        qcom-vadc-common.ko \
        qcom_wdt_core.ko \
        qfprom-sys.ko \
        qpnp-amoled-regulator.ko \
        qpnp-lcdb-regulator.ko \
        qpnp-pdphy.ko \
        qpnp-smb5-main.ko \
        qrtr.ko \
        qrtr-smd.ko \
        qseecom-mod.ko \
        qsee_ipc_irq_bridge.ko \
        qsee_ipc_irq.ko \
        qti-fixed-regulator.ko \
        rdbg.ko \
        regmap-spmi.ko \
        rmnet_core.ko \
        rmnet_ctl.ko \
        rmnet_offload.ko \
        rmnet_shs.ko \
        rndisipam.ko \
        rpmhpd.ko \
        rpmsg_char.ko \
        rtc-pm8xxx.ko \
        rt-pd-manager.ko \
        rx_macro_dlkm.ko \
        sensors_ssc.ko \
        service-locator.ko \
        service-notifier.ko \
        sg.ko \
        sgm4154x.ko \
        silead.ko \
        slimbus.ko \
        slimbus-ngd.ko \
        sm5109c_bias.ko \
        sm5602_fg.ko \
        smcinvoke.ko \
        smp2p.ko \
        smp2p_sleepstate.ko \
        smsm.ko \
        snd_event_dlkm.ko \
        snd-usb-audio-qmi.ko \
        socinfo.ko \
        spcom.ko \
        spi-msm-geni.ko \
        spmi-pmic-arb-debug.ko \
        spmi-pmic-arb.ko \
        sps_drv.ko \
        spss_utils.ko \
        st21nfc.ko \
        st54j_se.ko \
        stub_dlkm.ko \
        subsys-pil-tz.ko \
        subsystem_sleep_stats.ko \
        swr_ctrl_dlkm.ko \
        swr_dlkm.ko \
        synx-driver.ko \
        tcpci-core.ko \
        tcpc-rt1711h.ko \
        tx_macro_dlkm.ko \
        typec_ucsi.ko \
        usb_f_ccid.ko \
        usb_f_cdev.ko \
        usb_f_diag.ko \
        usb_f_gsi.ko \
        usb_f_ncm.ko \
        usb-storage.ko \
        usbtouchscreen.ko \
        uvcvideo.ko \
        v4l2-mem2mem.ko \
        va_macro_dlkm.ko \
        wcd937x_dlkm.ko \
        wcd937x_slave_dlkm.ko \
        wcd938x_dlkm.ko \
        wcd938x_slave_dlkm.ko \
        wcd9xxx_dlkm.ko \
        wcd_core_dlkm.ko \
        wlan_firmware_service_v01.ko \
        wsa881x_analog_dlkm.ko \
        xhci-hcd.ko \
        xhci-pci.ko \
        xhci-plat-hcd.ko"

# TWRP-debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

#
# For local builds only
#
# TWRP zip installer
ifneq ($(wildcard bootable/recovery/installer/.),)
    USE_RECOVERY_INSTALLER := true
    RECOVERY_INSTALLER_PATH := bootable/recovery/installer
endif

# Custom TWRP Versioning
# See https://github.com/minimal-manifest-twrp/android_device_common_version-info for details
ifneq ($(USE_CUSTOM_VERSION),)
    ifneq ($(wildcard device/common/version-info/.),)
        # version prefix is optional - the default value is "LOCAL" if nothing is set in device tree
        CUSTOM_TWRP_VERSION_PREFIX := Edward

        # Repo must be synced for automatic custom versioning to work
        include device/common/version-info/custom_twrp_version.mk

        ifeq ($(CUSTOM_TWRP_VERSION),)
            CUSTOM_TWRP_VERSION := $(shell date +%Y%m%d)-01
        endif
    endif
endif
#
# end local build flags
#
