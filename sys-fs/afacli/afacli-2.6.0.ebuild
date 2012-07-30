# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Dell(tm) Command Line Interface"
HOMEPAGE="http://support.dell.com/support/edocs/storage/57kgr/cli/en/index.htm"
SRC_URI="http://linux.dell.com/files/aacraid/afaapps-2.6-0.tar.gz"

LICENSE="Dell"
# The license is unclear.
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	tar xzf ${DISTDIR}/${A}
}

src_install() {
	mkdir -p ${D}/usr/sbin ${D}/dev/
	mv ${WORKDIR}/usr/sbin/* ${D}/usr/sbin/
	mv ${WORKDIR}/dev/MAKEDEV* ${D}/dev/
}

pkg_postinst() {
	for i in 0 1 2 3 4 5 6 7; do
		/dev/MAKEDEV.afa /dev/afa${i}
	done
}

pkg_prerm() {
	for i in 0 1 2 3 4 5 6 7; do
		rm /dev/afa${i}
	done
}
