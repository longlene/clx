# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

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

each_lua_compile() {
	emake cmark.so
}

each_lua_install() {
	dolua cmark cmark.so
}
