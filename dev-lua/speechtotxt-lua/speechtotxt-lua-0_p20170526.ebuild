# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

EGIT_COMMIT="aa555745aca46348750fbd3f46d810a2ffff1754"

DESCRIPTION="Library for using speech to text in Lua offline"
HOMEPAGE="https://github.com/stuarch/speechtotxt-lua"
SRC_URI="https://github.com/stuarch/speechtotxt-lua/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	app-accessibility/pocketsphinx
	app-accessibility/sphinxbase
"
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule speechtotxt.so
	dodc README.md
}
