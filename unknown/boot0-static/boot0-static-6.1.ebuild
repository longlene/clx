# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Static FreeBSD boot0 loader"

HOMEPAGE="http://www.freebsd.org"
SRC_URI="http://amd64-fbsd.unixevil.info/distfiles/boot0-static-${PV}.tar.bz2"
LICENSE="BSD"
SLOT="0"
KEYWORDS="-* ~amd64-fbsd ~x86-fbsd"
IUSE=""
DEPEND="!sys-freebsd/boot0"
PROVIDE="virtual/bootloader"

src_install() {
        cp -r ${WORKDIR}/* ${D}/
}
