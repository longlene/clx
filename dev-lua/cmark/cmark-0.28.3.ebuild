# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

DESCRIPTION="Lua bindings to libcmark CommonMark parser"
HOMEPAGE="https://github.com/jgm/cmark-lua"
SRC_URI="https://github.com/jgm/cmark-lua/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake cmark.so
}

src_install() {
	lua_install_cmodule cmark.so
	lua_install_module -r cmark
	dodoc README.md
}
