#!/vendor/bin/sh


### Process legacy widevine factory provisioning ###

SCRIPT_NAME="copy_wvcert.sh"
SRC="/vendor/etc/qcom_widevine_licenses.pfm"
DEST="/mnt/vendor/persist/data/pfm/licenses/qcom_widevine_licenses.pfm"
SECURE_PROP="ro.boot.secure_hardware"
HAS_COPIED="/mnt/vendor/persist/data/pfm/licenses/.wv_copy_done"

debug()
{
    echo "Debug: $*"
}

notice()
{
    echo "Debug: $*"
    echo "$SCRIPT_NAME: $*" > /dev/kmsg
}

current_md5=`md5sum $DEST.inst | cut -d" " -f1`
source_md5=`md5sum $SRC | cut -d" " -f1`
notice "current_md5:$current_md5"
notice "source_md5:$source_md5"

if [ -f $SRC ]
then
    if [ ! -f $HAS_COPIED ]
    then
       notice "copy widevine to persist:"
       cp $SRC $DEST
       echo "1" > /mnt/vendor/persist/data/pfm/licenses/.wv_copy_done
    elif [ -f $HAS_COPIED -a "$current_md5" != "$source_md5" ]
    then
       notice "remove old widevine licenses"
       rm /mnt/vendor/persist/data/pfm/licenses/.wv_copy_done
       rm /mnt/vendor/persist/data/pfm/licenses/qcom_widevine_licenses.pfm
       rm /mnt/vendor/persist/data/pfm/licenses/qcom_widevine_licenses.pfm.inst
       notice "copy widevine to persist:"
       cp $SRC $DEST
       echo "1" > /mnt/vendor/persist/data/pfm/licenses/.wv_copy_done
    fi
fi

fsync $HAS_COPIED
fsync $DEST


### Process Google widevine CDM remote provisioning ###

SRC_RKP="/vendor/etc/qcom_widevine_rkp_licenses.pfm"
DEST_RKP="/mnt/vendor/persist/data/pfm/licenses/qcom_widevine_rkp_licenses.pfm"
HAS_COPIED_RKP_LICENSE="/mnt/vendor/persist/data/pfm/licenses/.wv_rkp_copy_done"

dest_rkp_md5=`md5sum $DEST_RKP.inst | cut -d" " -f1`
source_rkp_md5=`md5sum $SRC_RKP | cut -d" " -f1`
notice "dest_rkp_md5:$dest_rkp_md5"
notice "source_rkp_md5:$source_rkp_md5"

if [ -f $SRC_RKP ]
then
    if [ ! -f $HAS_COPIED_RKP_LICENSE ]
    then
       notice "copy widevine rkp license to persist:"
       cp $SRC_RKP $DEST_RKP
       echo "1" > /mnt/vendor/persist/data/pfm/licenses/.wv_rkp_copy_done
    elif [ -f $HAS_COPIED_RKP_LICENSE -a "$dest_rkp_md5" != "$source_rkp_md5" ]
    then
       notice "remove old widevine rkp licenses"
       rm /mnt/vendor/persist/data/pfm/licenses/.wv_rkp_copy_done
       rm /mnt/vendor/persist/data/pfm/licenses/qcom_widevine_rkp_licenses.pfm
       rm /mnt/vendor/persist/data/pfm/licenses/qcom_widevine_rkp_licenses.pfm.inst
       notice "copy widevine rkp license to persist:"
       cp $SRC_RKP $DEST_RKP
       echo "1" > /mnt/vendor/persist/data/pfm/licenses/.wv_rkp_copy_done
    fi
fi

fsync $HAS_COPIED_RKP_LICENSE
fsync $DEST_RKP
