# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Context-free grammar parsing library"
HOMEPAGE="https://github.com/maandree/libparser"
SRC_URI="https://github.com/maandree/libparser/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "s#(PREFIX)/lib#(PREFIX)/$(get_libdir)#"  Makefile
}
