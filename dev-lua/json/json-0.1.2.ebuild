# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

DESCRIPTION="A lightweight JSON library for Lua"
HOMEPAGE="https://github.com/rxi/json.lua"
SRC_URI="https://github.com/rxi/json.lua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

each_lua_install() {
	dolua json.lua
}
