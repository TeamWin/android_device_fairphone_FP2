# Copyright (C) 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

-include vendor/fairphone/msm8974/BoardConfig.mk

LOCAL_PATH := device/fairphone/fp2

#TARGET_HAVE_HDMI_OUT := false

# Bootloader
TARGET_NO_BOOTLOADER := false
TARGET_BOOTLOADER_BOARD_NAME := fp2

# Platform
#BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330
TARGET_USES_QCOM_BSP := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_KERNEL_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Krait optimizations
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

# Assert
TARGET_OTA_ASSERT_DEVICE := FP2,fp2

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3b7 ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_SOURCE := kernel/fairphone/fp2
TARGET_KERNEL_CONFIG := fairphone_defconfig
#TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilts/kernel # fallback

KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-linux-androideabi-4.9/bin
ARM_EABI_TOOLCHAIN:= $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-linux-androideabi-4.9/bin
KERNEL_TOOLCHAIN_PREFIX := arm-linux-androideabi-


# Init
TARGET_INIT_VENDOR_LIB := libinit_fp2

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648 # 0x80000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27358941675
BOARD_CACHEIMAGE_PARTITION_SIZE := 671088640 # 0x28000000
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5242880 # 0x500000
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 73400320 # 0x4600000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true

# Audio
BOARD_USES_ALSA_AUDIO := true

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Graphics
USE_OPENGL_RENDERER := true
TARGET_HARDWARE_3D := false
TARGET_USES_OVERLAY := true
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so # Enables Adreno RS driver
BOARD_EGL_CFG := $(LOCAL_PATH)/graphics/egl.cfg

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Camera
USE_CAMERA_STUB := false
TARGET_USES_AOSP := false

# GPS
TARGET_NO_RPC := true

# Radio
TARGET_NO_RADIOIMAGE := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
ADD_RADIO_FILES ?= true # Add NON-HLOS files for ota upgrade

# CNE
TARGET_LDPRELOAD := libNimsWrap.so

# Protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := false

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/generic/common/bluetooth

# NFC
TARGET_USES_QCA_NFC := other

# WiFi
WPA_SUPPLICANT_VERSION := VER_0_8_X

# inherit from the proprietary version
-include vendor/fairphone/fp2/BoardConfigVendor.mk


# Use signed boot and recovery image
#TARGET_BOOTIMG_SIGNED := true

# TWRP

TW_THEME := portrait_hdpi
TW_NO_USB_STORAGE := false
TW_TARGET_USES_QCOM_BSP := true
TW_NO_EXFAT := true
TW_NO_EXFAT_FUSE := true
TW_INCLUDE_CRYPTO := true
TW_NO_LEGACY_PROPS := true
