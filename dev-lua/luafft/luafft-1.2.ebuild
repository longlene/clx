# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua

DESCRIPTION="Lua package that includes functions for Fast Fourier Transformations"
HOMEPAGE="https://github.com/h4rm/luafft"
SRC_URI="https://github.com/h4rm/luafft/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module src/{complex,luafft}.lua
	dodoc README.md
}
