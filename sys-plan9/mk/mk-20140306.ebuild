# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Make equivalent for the Plan9 System"
HOMEPAGE="http://cm.bell-labs.com/magic/man2html/1/mk"
SRC_URI="http://plan9port.googlecode.com/files/plan9port-${PV}.tgz"

LICENSE="PLAN9"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/plan9port"

src_prepare() {
	sed -i 's/_BSD_SOURCE/_DEFAULT_SOURCE/' src/lib9/utf/utfecpy.c src/cmd/troff/n2.c src/cmd/troff/n7.c src/cmd/grap/main.c include/u.h
}

src_compile() {
	PLAN9=`pwd` export PLAN9
	PATH=/bin:/usr/bin:$PLAN9/bin:$PATH export PATH

	cd ${S}/src
	${S}/dist/buildmk
}

src_install() {
	dobin ${S}/bin/mk || die "dobin failed!"
	doman ${S}/man/man1/mk.1 || die "doman failed!"
}
