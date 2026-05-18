# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit lua

DESCRIPTION="The Cloud-Native API Gateway"
HOMEPAGE="https://apisix.apache.org/blog/"
SRC_URI="https://github.com/apache/apisix/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}
	>=dev-lua/lua-resty-ctxdump-0.1[${LUA_USEDEP}]
	>=dev-lua/api7-lua-resty-dns-client-7.0.1[${LUA_USEDEP}]
	>=dev-lua/lua-resty-template-2.0[${LUA_USEDEP}]
	>=dev-lua/lua-resty-etcd-1.10.5[${LUA_USEDEP}]
	>=dev-lua/api7-lua-resty-http-0.2.2[${LUA_USEDEP}]
	>=dev-lua/lua-resty-balancer-0.04[${LUA_USEDEP}]
	>=dev-lua/lua-resty-ngxvar-0.5.2[${LUA_USEDEP}]
	>=dev-lua/lua-resty-jit-uuid-0.0.7[${LUA_USEDEP}]
	>=dev-lua/lua-resty-worker-events-1.0.0[${LUA_USEDEP}]
	>=dev-lua/lua-resty-healthcheck-api7-3.0.0[${LUA_USEDEP}]
	>=dev-lua/api7-lua-resty-jwt-0.2.5[${LUA_USEDEP}]
	>=dev-lua/lua-resty-hmac-ffi-0.06[${LUA_USEDEP}]
	>=dev-lua/lua-resty-cookie-0.2.0[${LUA_USEDEP}]
	>=dev-lua/lua-resty-session-3.10[${LUA_USEDEP}]
	>=dev-lua/opentracing-openresty-0.1[${LUA_USEDEP}]
	>=dev-lua/lua-resty-radixtree-2.8.2[${LUA_USEDEP}]
	>=dev-lua/lua-protobuf-0.5.0[${LUA_USEDEP}]
	>=dev-lua/lua-resty-openidc-1.7.6[${LUA_USEDEP}]
	>=dev-lua/luafilesystem-1.7.0[${LUA_USEDEP}]
	>=dev-lua/api7-lua-tinyyaml-0.4.4[${LUA_USEDEP}]
	>=dev-lua/nginx-lua-prometheus-0.20230607[${LUA_USEDEP}]
	>=dev-lua/jsonschema-0.9.8[${LUA_USEDEP}]
	>=dev-lua/lua-resty-ipmatcher-0.6.1[${LUA_USEDEP}]
	>=dev-lua/lua-resty-kafka-0.22[${LUA_USEDEP}]
	>=dev-lua/lua-resty-logger-socket-2.0.1[${LUA_USEDEP}]
	>=dev-lua/skywalking-nginx-lua-0.6.0[${LUA_USEDEP}]
	>=dev-lua/base64-1.5[${LUA_USEDEP}]
	>=dev-lua/binaryheap-0.4[${LUA_USEDEP}]
	>=dev-lua/api7-dkjson-0.1.1[${LUA_USEDEP}]
	>=dev-lua/resty-redis-cluster-1.05[${LUA_USEDEP}]
	>=dev-lua/lua-resty-expr-1.3.2[${LUA_USEDEP}]
	>=dev-lua/graphql-0.0.2[${LUA_USEDEP}]
	>=dev-lua/argparse-0.7.1[${LUA_USEDEP}]
	>=dev-lua/luasocket-3.1.0[${LUA_USEDEP}]
	>=dev-lua/luasec-1.3.2[${LUA_USEDEP}]
	>=dev-lua/lua-resty-consul-0.3[${LUA_USEDEP}]
	>=dev-lua/penlight-1.13.1[${LUA_USEDEP}]
	>=dev-lua/ext-plugin-proto-0.6.1[${LUA_USEDEP}]
	>=dev-lua/casbin-1.41.8[${LUA_USEDEP}]
	>=dev-lua/inspect-3.1.1[${LUA_USEDEP}]
	>=dev-lua/lualdap-1.2.6[${LUA_USEDEP}]
	>=dev-lua/lua-resty-rocketmq-0.3.0[${LUA_USEDEP}]
	>=dev-lua/opentelemetry-lua-0.2[${LUA_USEDEP}]
	>=dev-lua/net-url-0.9[${LUA_USEDEP}]
	>=dev-lua/xml2lua-1.5[${LUA_USEDEP}]
	>=dev-lua/nanoid-0.1[${LUA_USEDEP}]
	>=dev-lua/lua-resty-mediador-0.1.2[${LUA_USEDEP}]
	>=dev-lua/lua-resty-ldap-0.1.0[${LUA_USEDEP}]
	>=dev-lua/lua-resty-t1k-1.1.0[${LUA_USEDEP}]
	>=dev-lua/brotli-ffi-0.3[${LUA_USEDEP}]
	>=dev-lua/lua-ffi-zlib-0.6[${LUA_USEDEP}]
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/apisix_home =/{s#/usr/local/apisix#/usr/share/lua/5.1/apisix#}' \
		-i apisix/cli/apisix.lua
	sed -e 's#command -v openresty#command -v nginx#' \
		-i 's#openresty -V#nginx -V#' \
		-i apisix/cli/env.lua
}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r apisix
}

src_install() {
	lua_foreach_impl lua_src_install
	doexe "${FILESDIR}"/apisix
	einstalldocs
}
