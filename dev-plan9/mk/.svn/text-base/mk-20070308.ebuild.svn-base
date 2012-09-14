# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Make equivalent for the Plan9 System"
HOMEPAGE="http://cm.bell-labs.com/magic/man2html/1/mk"
SRC_URI="http://www.kix.in/plan9/plan9port-repack-${PV}.tar.bz2"

LICENSE="PLAN9"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/plan9"

src_compile() {
	PLAN9=`pwd` export PLAN9
	PATH=/bin:/usr/bin:$PLAN9/bin:$PATH export PATH

	cd ${S}/src
	${S}/dist/buildmk
}

src_install() {
	dobin ${S}/bin/mk
	doman ${S}/man/man1/mk.1
}
