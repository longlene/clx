# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

ESVN_REPO_URI="http://${PN}.googlecode.com/svn/trunk/"
ESVN_PROJECT="${PN}-read-only"

DESCRIPTION="Program to extract files from a yaffs file system image."
HOMEPAGE="http://code.google.com/p/unyaffs/"
LICENSE="GPL-3"
SLOT="0"
RESTRICT=""
KEYWORDS="~amd64 ~x86"
RDEPEND=""
DEPEND=""

S="${WORKDIR}/${PN}-read-only"

src_compile() {
	gcc -o ${PN} ${PN}.c || die "Compilation failed"
}

src_install() {
	dobin ${PN}
}
