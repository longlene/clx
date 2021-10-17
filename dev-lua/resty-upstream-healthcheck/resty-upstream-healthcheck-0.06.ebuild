# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="Health Checker for Nginx Upstream Servers in Pure Lua"
HOMEPAGE="https://github.com/openresty/lua-resty-upstream-healthcheck"
SRC_URI="https://github.com/openresty/lua-resty-upstream-healthcheck/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	www-servers/nginx:*[nginx_modules_http_lua,nginx_modules_http_lua_upstream]
"
DEPEND="
	${RDEPEND}
"

DOCS=(README.markdown)

each_lua_install() {
	dolua lib/resty
}
