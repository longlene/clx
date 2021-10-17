# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3

DESCRIPTION="CoAP implementation that focuses on simplicity by offering a minimal set of functions and straightforward interface"
HOMEPAGE="https://github.com/staropram/cantcoap"
SRC_URI=""

EGIT_REPO_URI="https://github.com/staropram/cantcoap.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake staticlib
}

src_install() {
	dolib.a lib${PN}.a
	insinto /usr/include
	doins ${PN}.h
	dodoc README.md
}
