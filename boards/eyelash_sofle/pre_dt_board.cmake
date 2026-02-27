# Copyright (c) 2024 The ZMK Contributors
# SPDX-License-Identifier: MIT

# Suppress duplicate unit-address warnings for nRF52840
# (clock/power at 0x40000000, acl/flash-controller at 0x4001e000)
list(APPEND EXTRA_DTC_FLAGS "-Wno-unique_unit_address_if_enabled")
