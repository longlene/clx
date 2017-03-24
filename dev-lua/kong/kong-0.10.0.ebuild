# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="The API Gateway & Microservice Management Layer"
HOMEPAGE="https://getkong.org"
SRC_URI="https://github.com/Mashape/kong/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luasec
	dev-lua/luasocket
	dev-lua/penlight
	dev-lua/mediator_lua
	dev-lua/lua-resty-http
	dev-lua/lua-resty-jit-uuid
	dev-lua/multipart
	dev-lua/version
	dev-lua/lapis
	dev-lua/lua-cassandra
	dev-lua/pgmoon-mashape
	dev-lua/luatz
	dev-lua/lua_system_constants
	dev-lua/lua-resty-iputils
	dev-lua/luacrypto
	dev-lua/luasyslog
	dev-lua/lua_pack
	dev-lua/lua-resty-dns-client
	dev-lua/lua-resty-worker-events
"
src_compile() {
	:
}

src_install() {
	lua_install_module -r kong
	dobin bin/kong
	dodoc README.md
}
