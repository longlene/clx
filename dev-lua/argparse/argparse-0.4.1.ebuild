# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="Feature-rich command line parser for Lua"
HOMEPAGE="https://github.com/mpeterv/argparse"
SRC_URI="https://github.com/mpeterv/argparse/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module src/argparse.lua
	dodoc README.md
}
