# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit lua

DESCRIPTION="Lua bindings for linenoise"
HOMEPAGE="https://github.com/hoelzro/lua-linenoise"
SRC_URI="https://github.com/hoelzro/lua-linenoise/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule linenoise.so
	dodoc README.md
}
