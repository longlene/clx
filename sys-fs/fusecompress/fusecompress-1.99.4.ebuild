# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Transparent filesystem compression via FUSE. Supports lzo, gzip and bzip2"
SRC_URI="http://miio.net/files/fusecompress-${PV}.tar.gz"
HOMEPAGE="http://miio.net/fusecompress/"
LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"
RDEPEND=""
DEPEND=">=sys-fs/fuse-2.4.1-r1
	>=app-arch/bzip2-1.0.3-r5
	>=sys-libs/zlib-1.2.3
	>=dev-libs/rlog-1.3.7"

src_compile() {
	econf
	emake
}

src_install() {
	dobin fusecompress
	dodoc NEWS README
}
