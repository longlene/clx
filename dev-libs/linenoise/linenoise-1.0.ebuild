# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit flag-o-matic

DESCRIPTION="A small self-contained alternative to readline and libedit"
HOMEPAGE="https://github.com/antirez/linenoise"
SRC_URI="https://github.com/antirez/linenoise/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

pkg_pretend() {
	append-cflags -fPIC
}

src_prepare() {
	epatch "${FILESDIR}"/build_library.patch
}

src_install() {
	dolib.so *.so*
	insinto /usr/include
	doins linenoise.h
	dodoc README.markdown
}
