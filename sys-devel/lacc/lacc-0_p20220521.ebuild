# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="30839843daaff9d87574b5854854c9ee4610cdcd"

DESCRIPTION="A simple, self-hosting C compiler"
HOMEPAGE="https://github.com/larmel/lacc"
SRC_URI="https://github.com/larmel/lacc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "/LACC_LIB_PATH=/{s#\$(LIBDIR_SOURCE)#/usr/$(get_libdir)/lacc#}" Makefile
}

src_install() {
	insinto /usr/$(get_libdir)/lacc
	doins -r bin/include
	dobin bin/lacc
	dodoc README.md
}
