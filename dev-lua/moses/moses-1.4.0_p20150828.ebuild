# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

EGIT_COMMIT="daf91d0333e9b6d345ff37c698925dcb12caeec9"

DESCRIPTION="Utility library for functional programming in Lua"
HOMEPAGE="https://github.com/Yonaba/Moses"
SRC_URI="https://github.com/Yonaba/Moses/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module moses.lua moses_min.lua
	dodoc README.md
}
