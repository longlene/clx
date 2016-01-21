# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit toolchain-funcs

MY_P=${P/-/.}

DESCRIPTION="base64 Source Code in C"
HOMEPAGE="http://base64.sourceforge.net/"
SRC_URI="mirror://sourceforge/base64/${MY_P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_compile() {
	$(tc-getCC) -o ${PN} b64.c
}

src_install() {
	dobin b64
	dodoc readme.txt
}
