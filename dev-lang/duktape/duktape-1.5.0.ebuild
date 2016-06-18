# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="An embeddable Javascript engine"
HOMEPAGE="http://duktape.org"
SRC_URI="http://duktape.org/${P}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	epatch "${FILESDIR}"/funtoo-Makefile.sharedlibrary.patch
}

src_compile() {
	emake -f Makefile.sharedlibrary
}

src_install() {
	#emake -f Makefile.sharedlibrary install
	insinto /usr/include
	doins src/{duk_config.h,duktape.h}
	dolib.so libduktape.so*
	dobin duk
	dodoc README.rst
}
