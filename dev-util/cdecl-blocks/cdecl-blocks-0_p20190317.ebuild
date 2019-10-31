# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="ac818eae23deabee8718b52a7607fdda9fd9f393"

DESCRIPTION="The venerable cdecl"
HOMEPAGE="https://github.com/ridiculousfish/cdecl-blocks"
SRC_URI="https://github.com/ridiculousfish/cdecl-blocks/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin c++decl
	dosym c++decl /usr/bin/cdecl
	doman cdecl.1 c++decl.1
	dodoc README
}
