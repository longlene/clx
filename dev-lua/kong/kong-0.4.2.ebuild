# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="Microservice & API Management Layer"
HOMEPAGE="https://getkong.org"
SRC_URI="mirror://github/Mashape/kong/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luasec
dev-lua/uuid
dev-lua/luatz
dev-lua/yaml
dev-lua/lapis
dev-lua/stringy
dev-lua/lua-cassandra
dev-lua/multipart
dev-lua/lua-path
dev-lua/lua-cjson
dev-lua/ansicolors
dev-lua/lbase64
dev-lua/lua-resty-iputils
dev-lua/luasocket
dev-lua/lrexlib-pcre
dev-lua/lua-llthreads2
"
src_compile() {
	:
}

src_install() {
	lua_install_module -r kong
	dobin bin/kong
	dodoc README.md
}
