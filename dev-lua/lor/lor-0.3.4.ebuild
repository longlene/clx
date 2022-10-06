# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua

DESCRIPTION="A fast and minimalist web framework based on OpenResty"
HOMEPAGE="https://github.com/sumory/lor"
SRC_URI="https://github.com/sumory/lor/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/lua-resty-template[${LUA_USEDEP}]
	dev-lua/lua-resty-cookie[${LUA_USEDEP}]
"
BDEPEND=""

src_compile() {
	:
}

each_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r lib/lor
}

src_install() {
	lua_foreach_impl each_src_install
	insinto /usr/share/lor/
	doins -r bin
	dobin "${FILESDIR}"/lord
	einstalldocs
}
