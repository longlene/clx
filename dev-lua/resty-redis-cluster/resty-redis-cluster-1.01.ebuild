# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

LUA_COMPAT="luajit2"

inherit lua

DESCRIPTION="Openresty lua client for redis cluster"
HOMEPAGE="https://github.com/steve0511/resty-redis-cluster"
SRC_URI="https://github.com/steve0511/resty-redis-cluster/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	virtual/lua[luajit]
	www-servers/nginx:*[nginx_modules_http_lua]
"
DEPEND="
	${RDEPEND}
"

DOCS=(README.md)

each_lua_install() {
	dolua_jit lib/resty
}
