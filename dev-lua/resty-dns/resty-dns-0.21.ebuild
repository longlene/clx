# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="Lua DNS resolver for the ngx_lua based on the cosocket API"
HOMEPAGE="https://github.com/openresty/lua-resty-dns"
SRC_URI="https://github.com/openresty/lua-resty-dns/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	virtual/lua[bit]
	www-servers/nginx:*[nginx_modules_http_lua]
"
DEPEND="
	${RDEPEND}
"

DOCS=(README.markdown)

each_lua_install() {
	dolua lib/resty
}
