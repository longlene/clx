# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="65f2d3d61b9b13bdc380afc2eaf0c7c6ef461be7"

DESCRIPTION="A Lua REPL and debugger"
HOMEPAGE="https://github.com/giann/croissant"
SRC_URI="https://github.com/giann/croissant/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-lua/sirocco-0.0.1
	>=dev-lua/hump-0.4
	>=dev-lua/lpeg-1.0.1
	>=dev-lua/argparse-0.6.0
	>=dev-lua/compat53-0.7
"
BDEPEND=""

DOCS=( READM.md )

each_lua_install() {
	dolua croissant
}

all_lua_install() {
	dobin bin/croissant
}
