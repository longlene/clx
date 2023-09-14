# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Wren Programming Language"
HOMEPAGE="https://wren.io/"
SRC_URI="https://github.com/wren-lang/wren/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/LDFLAGS/{s# -s$##}' \
		-i projects/make/wren{,_shared}.make
}

src_compile() {
	emake -C projects/make
}

src_install() {
	insinto /usr
	doins -r src/include
	dolib.so lib/libwren.so
	dodoc README.md
}
