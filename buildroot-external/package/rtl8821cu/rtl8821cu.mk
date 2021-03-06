RTL8821CU_VERSION = 8c2226a74ae718439d56248bd2e44ccf717086d5
RTL8821CU_SITE = $(call github,brektrou,rtl8821CU,$(RTL8821CU_VERSION))
RTL8821CU_LICENSE = GPL-2.0
RTL8821CU_LICENSE_FILES = LICENSE

RTL8821CU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8821CU=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KBASE=$(LINUX_DIR) \
	CROSS_COMPILE=$(TARGET_CROSS)

ifeq (arm, $(filter arm, $(KERNEL_ARCH)))
RTL8821CU_MODULE_MAKE_OPTS += CONFIG_PLATFORM_ARM_RPI=y
RTL8821CU_MODULE_MAKE_OPTS += CONFIG_PLATFORM_ARM64_RPI=y
else
RTL8821CU_MODULE_MAKE_OPTS += CONFIG_PLATFORM_I386_PC=y
endif

$(eval $(kernel-module))
$(eval $(generic-package))
