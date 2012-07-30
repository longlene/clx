# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Command line script to generate a Gentoo system report"
HOMEPAGE="http://code.google.com/p/greport/"
SRC_URI="http://linuxcrazy.com/greport/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/python"
RDEPEND="${DEPEND} sys-apps/usbutils sys-apps/pciutils"

src_install() {
    distutils_src_install
    exeinto /usr/$(get_libdir)/python${PYVER}/site-packages
    doexe greport.py || die "doexe failed"
    dosym /usr/$(get_libdir)/python${PYVER}/site-packages/greport.py /usr/bin/greport || die "dosym failed"
}

