#
# Copyright (c) 2016-2020, ARM Limited and Contributors. All rights reserved.
#
# SPDX-License-Identifier: BSD-3-Clause
#

# SP_MIN source files specific to FVP platform
BL32_SOURCES		+=	drivers/arm/fvp/fvp_pwrc.c			\
				drivers/cfi/v2m/v2m_flash.c			\
				lib/utils/mem_region.c				\
				plat/arm/board/fvp/aarch32/fvp_helpers.S	\
				plat/arm/board/fvp/fvp_pm.c			\
				plat/arm/board/fvp/fvp_topology.c		\
				plat/arm/board/fvp/sp_min/fvp_sp_min_setup.c	\
				plat/arm/common/arm_nor_psci_mem_protect.c	\
				${FVP_CPU_LIBS}					\
				${FVP_GIC_SOURCES}				\
				${FVP_INTERCONNECT_SOURCES}			\
				${FVP_SECURITY_SOURCES}

# Support for fconf in SP_MIN(BL32)
# Added separately from the above list for better readability
ifeq ($(filter 1,${BL2_AT_EL3} ${RESET_TO_SP_MIN}),)
BL32_SOURCES		+=	common/fdt_wrappers.c				\
				lib/fconf/fconf.c				\
				plat/arm/board/fvp/fconf/fconf_hw_config_getter.c
endif

include plat/arm/common/sp_min/arm_sp_min.mk
