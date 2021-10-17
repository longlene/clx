# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="Chat bot engine based on Markov chains"
HOMEPAGE="https://github.com/darkstalker/lua_brain"
SRC_URI="https://github.com/darkstalker/lua_brain/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/lsqlite3
dev-lua/luautf8
"

S="${WORKDIR}"/lua_${P}

DOCS=( README.md )

each_lua_install() {
	dolua src/{brain,brain.lua}
}
