# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="fbe330b676d2098f7211545b454e8ab5891f07e5"

DESCRIPTION="Colorful screen logging helper for Lua"
HOMEPAGE="https://github.com/cdluminate/torch-rainbowlog"
SRC_URI="https://github.com/cdluminate/torch-rainbowlog/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module rainbowlog.lua
	dodoc README.md
}
