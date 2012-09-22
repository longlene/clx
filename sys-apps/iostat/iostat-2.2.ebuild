# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="I/O performance monitoring utility"
HOMEPAGE="http://www.linuxinsight.com/iostat_utility.html"
SRC_URI="http://www.linuxinsight.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	emake CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" || die
}

src_install() {
	dodoc README || die
	doman ${PN}.8 || die
	dobin ${PN} || die
}
