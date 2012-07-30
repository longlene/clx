# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="FuseCompress - compresses filesystem"
HOMEPAGE="http://www.miio.net/fusecompress/"
SRC_URI="http://miio.net/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-fs/fuse
	app-arch/bzip2
	app-arch/gzip
	sys-libs/zlib
	dev-libs/lzo
	>=dev-libs/rlog-1.3"
RDEPEND="${DEPEND}"

inherit flag-o-matic

src_unpack() {
	unpack ${A}
	cd ${S}/src
	epatch ${FILESDIR}/${P}-no-lock-hpp.patch
	epatch ${FILESDIR}/${P}-lock-wrkarnd.patch
}


src_compile() {
	append-flags "-include stdlib.h"
	econf
	emake || die "?"
	dodoc NEWS README ChangeLog
}

#src_install() {
#	emake install DESTDIR="${D}" || die "emake install failed"
#	dodoc ChangeLog README
#}

