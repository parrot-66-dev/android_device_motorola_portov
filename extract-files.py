#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.extract import extract_fns_user_type
from extract_utils.extract_star import (
    extract_star_firmware,
    star_firmware_regex,
)
from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import lib_fixups
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/motorola/sm7435-common',
    'vendor/motorola/sm7435-common',
    'hardware/motorola',
    'hardware/qcom-caf/sm8450',
    'vendor/qcom/opensource/commonsys-intf/display',
]

blob_fixups: blob_fixups_user_type = {
}

extract_fns: extract_fns_user_type = {
    star_firmware_regex: extract_star_firmware,
}

module = ExtractUtilsModule(
    'paros',
    'motorola',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    add_generated_carriersettings=True,
    extract_fns=extract_fns,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
