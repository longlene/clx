# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit ninja-utils

DESCRIPTION="Public domain cross platform lock free thread caching 16-byte aligned memory allocator implemented in C"
HOMEPAGE="https://github.com/mjansson/rpmalloc"
SRC_URI="https://github.com/mjansson/rpmalloc/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	./configure.py || die "configure failed"
}

src_compile() {
	eninja
}

src_install() {
	insinto /usr/include
	doins rpmalloc/*.h
	dolib.a lib/linux/release/*/librpmalloc{,wrap}.a
	dodoc README.md
}
