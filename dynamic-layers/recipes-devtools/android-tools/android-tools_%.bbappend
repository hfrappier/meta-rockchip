# Copyright (C) 2019, Fuzhou Rockchip Electronics Co., Ltd
# Released under the MIT license (see COPYING.MIT for the terms)

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://adbd.sh"

do_install_append() {
	install -d ${D}${sysconfdir}/init.d
	install -m 0755 ${WORKDIR}/adbd.sh ${D}${sysconfdir}/init.d/adbd.sh
}

inherit update-rc.d

INITSCRIPT_NAME = "adbd.sh"
INITSCRIPT_PARAMS = "start 70 5 4 3 2 . stop 30 0 1 6 ."
