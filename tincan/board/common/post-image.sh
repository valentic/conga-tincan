#!/bin/bash

##########################################################################
#
#   Create an xz compressed SD card image with the project name.
#
#   2023-12-19  Todd Valentic
#               Initial implementation
#
##########################################################################

set -e

BOARD_DIR="$(dirname $0)"
BOARD_NAME="$(basename ${CONFIG_DIR})"

env > $BINARIES_DIR/env.txt

if [ -f ${BOARD_DIR}/release.conf ]; then
    . ${BOARD_DIR}/release.conf
fi

cd ${BINARIES_DIR}

if [ ! -f sdcard.img ]; then
    exit 0
fi

SDNAME=sdcard-${BOARD_NAME}-${RELEASE}.img

mv sdcard.img ${SDNAME}
xz -k -f -T0 ${SDNAME} 

