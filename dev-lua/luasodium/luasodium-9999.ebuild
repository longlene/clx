# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit lua git-r3

DESCRIPTION="Lua binding to libsodium"
HOMEPAGE="https://github.com/jedisct1/libsodium"
SRC_URI=""

EGIT_REPO_URI="https://github.com/daurnimator/luasodium.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/libsodium
"

src_install() {
	lua_install_module -r sodium
	dodoc README.md
}
