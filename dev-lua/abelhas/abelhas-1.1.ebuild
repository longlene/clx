# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit lua vcs-snapshot

DESCRIPTION="A particle swarm optimization library for Lua"
HOMEPAGE="http://ittner.github.com/abelhas"
SRC_URI="https://github.com/ittner/abelhas/archive/abelhas-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DOCS=( README luapso.ps )

each_lua_install() {
	dolua pso.lua
}
