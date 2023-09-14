# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..3} luajit )

inherit lua vcs-snapshot

DESCRIPTION="Library for creating ZIP archive"
HOMEPAGE="https://github.com/moteus/ZipWriter"
SRC_URI="https://github.com/moteus/ZipWriter/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}
	dev-lua/lzlib
	dev-lua/struct
"

DOCS=( README.md )

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r lua/{ZipWriter,ZipWriter.lua}
}

src_install() {
	lua_foreach_impl lua_src_install
	einstalldocs
}
