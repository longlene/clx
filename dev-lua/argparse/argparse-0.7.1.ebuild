# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="Feature-rich command line parser for Lua"
HOMEPAGE="https://github.com/mpeterv/argparse"
SRC_URI="https://github.com/luarocks/argparse/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

DOCS=( README.md )

each_lua_install() {
	dolua src/argparse.lua
}
