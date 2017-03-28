# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

DESCRIPTION="Fifo library for Lua"
HOMEPAGE="https://github.com/daurnimator/fifo.lua"
SRC_URI="https://github.com/daurnimator/fifo.lua/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module fifo.lua
	dodoc README.md
}
