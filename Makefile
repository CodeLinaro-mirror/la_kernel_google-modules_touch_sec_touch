# SPDX-License-Identifier: GPL-2.0

KERNEL_SRC ?= /lib/modules/$(shell uname -r)/build
M ?= $(shell pwd)

CFLAGS_MODULE	+= -DDYNAMIC_DEBUG_MODULE
EXTRA_SYMBOLS	+= $(OUT_DIR)/../private/google-modules/touch/common/Module.symvers

modules modules_install clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) \
	CFLAGS_MODULE="$(CFLAGS_MODULE)" KBUILD_EXTRA_SYMBOLS="$(EXTRA_SYMBOLS)" $(@)
