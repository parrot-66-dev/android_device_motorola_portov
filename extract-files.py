#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
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
    'device/motorola/mona',
    'device/motorola/sm7435-common',
    'vendor/motorola/sm7435-common',
    'hardware/motorola',
    'hardware/qcom-caf/sm8450-6.6',
    'vendor/qcom/opensource/commonsys-intf/display',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/lib64/libBSTSWAD.so': blob_fixup()
        .clear_symbol_version('AHardwareBuffer_allocate')
        .clear_symbol_version('AHardwareBuffer_describe')
        .clear_symbol_version('AHardwareBuffer_lock')
        .clear_symbol_version('AHardwareBuffer_lockPlanes')
        .clear_symbol_version('AHardwareBuffer_release')
        .clear_symbol_version('AHardwareBuffer_unlock'),
    (
        'vendor/lib64/camera/components/com.qti.node.dewarp.so',
        'vendor/lib64/hw/com.qti.chi.override.so',
        'vendor/lib64/libcamximageformatutils.so',
        'vendor/lib64/libchifeature2.so',
        'vendor/lib64/vendor.qti.hardware.camera.postproc@1.0-service-impl.so',
    ): blob_fixup()
        .replace_needed('android.hardware.graphics.allocator-V1-ndk.so', 'android.hardware.graphics.allocator-V2-ndk.so'),
    'vendor/etc/init/android.hardware.biometrics.fingerprint-service-rbs2.rc': blob_fixup()
        .regex_replace(r'\s+disabled\n', ''),
    'vendor/lib64/com.motorola.hardware.biometric.fingerprint@1.1.so': blob_fixup()
        .add_needed('libshim_fp.so'),
}

extract_fns: extract_fns_user_type = {
    star_firmware_regex: extract_star_firmware,
}

module = ExtractUtilsModule(
    'mona',
    'motorola',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    extract_fns=extract_fns,
    add_generated_carriersettings=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
