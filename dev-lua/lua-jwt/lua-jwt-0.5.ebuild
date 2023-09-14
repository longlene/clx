# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua

DESCRIPTION="JSON Web Token library"
HOMEPAGE="https://github.com/Olivine-Labs/lua-jwt"
SRC_URI="https://github.com/Olivine-Labs/lua-jwt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/busted
	dev-lua/luaossl
	dev-lua/lua-cjson-ol
	dev-lua/basexx
"

src_install() {
	lua_install_module -r src/jwt{,.lua}
	dodoc README.md
}
