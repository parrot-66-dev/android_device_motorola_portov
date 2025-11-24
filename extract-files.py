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
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/motorola/mona',
    'hardware/motorola',
    'hardware/qcom-caf/sm8750',
    'hardware/qcom-caf/wlan',
    'vendor/qcom/opensource/commonsys/display',
    'vendor/qcom/opensource/commonsys-intf/display',
    'vendor/qcom/opensource/dataservices',
    'vendor/qcom/opensource/display'
]


libs_add_vendor_suffix = (
)

libs_remove = (
)


def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    if partition != 'vendor':
        return None

    return f'{lib}_{partition}'

libs_add_vendor_suffix = (
    'vendor.qti.hardware.qccsyshal@1.0',
    'vendor.qti.hardware.qccsyshal@1.1',
    'vendor.qti.qspmhal@1.0',
    'vendor.qti.imsrtpservice@3.0',
    'vendor.qti.diaghal@1.0',
    'com.qualcomm.qti.dpm.api@1.0',
)

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    libs_add_vendor_suffix: lib_fixup_vendor_suffix,
    libs_remove: lib_fixup_remove,
}

blob_fixups: blob_fixups_user_type = {
 'vendor/lib64/sensors.moto.so': blob_fixup().add_needed('libbase_shim.so'),
(
        'vendor/lib64/libapengine.so', 'vendor/lib64/libgamepoweroptfeature.so', 'vendor/lib64/libpsmoptfeature.so', 'vendor/lib64/libqcodec2_utils.so', 'vendor/lib64/libqti-perfd.so', 'vendor/lib64/libvideooptfeature.so'
    ): blob_fixup()
        .replace_needed('vendor.qti.hardware.display.config-V5-ndk.so', 'vendor.qti.hardware.display.config-V12-ndk.so'),
    (
        'vendor/lib64/vendor.qti.hardware.camera.postproc@1.0-service-impl.so', 'vendor/lib64/libcamximageformatutils.so', 'vendor/lib64/camera/components/com.qti.node.dewarp.so', 'vendor/lib64/hw/com.qti.chi.override.so'
    ): blob_fixup()
        .replace_needed('android.hardware.graphics.allocator-V1-ndk.so', 'android.hardware.graphics.allocator-V2-ndk.so'),
    (
        'vendor/lib64/libqcodec2_core.so'
    ): blob_fixup()
        .replace_needed('android.hardware.graphics.common-V5-ndk.so', 'android.hardware.graphics.common-V6-ndk.so'),
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
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
