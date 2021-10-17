# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="Library for parsing HTTP Cookie header for Nginx"
HOMEPAGE="https://github.com/cloudflare/lua-resty-cookie"
SRC_URI="https://github.com/cloudflare/lua-resty-cookie/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	www-servers/nginx:*[nginx_modules_http_lua]
"
DEPEND="
	${RDEPEND}
"

DOCS=(README.md)

each_lua_install() {
	dolua lib/resty
}
