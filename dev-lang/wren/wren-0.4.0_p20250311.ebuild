# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="77aeb12ab8cff432dcc0e0c511d0f30366650f15"

DESCRIPTION="The Wren Programming Language"
HOMEPAGE="https://wren.io/"
SRC_URI="https://github.com/wren-lang/wren/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	sed -e '/LDFLAGS/{s# -s$##}' \
		-i projects/make/wren{,_shared}.make
}

src_compile() {
	emake -C projects/make verbose=1
}

src_install() {
	doheader src/include/wren.h{,pp}
	dolib.so lib/libwren.so
	use static-libs && dolib.a lib/libwren.a
	dodoc README.md
}
