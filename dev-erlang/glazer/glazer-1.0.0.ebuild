# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Fast JSON/YAML/CSV encoder/decoder for Erlang and Elixir"
HOMEPAGE="https://github.com/saleyn/glazer"
SRC_URI="https://github.com/saleyn/glazer/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="jq"

RDEPEND="${DEPEND}
	jq? ( app-misc/jq:= )"
DEPEND="${RDEPEND}"

src_prepare() {
	rebar3_src_prepare
	# Build NIF explicitly in src_compile with controlled HAVE_JQ
	sed -i 's|{pre_hooks,.*make -s nif.*}|{pre_hooks, []}|' rebar.config || die
	# Respect the profile's CFLAGS instead of forcing a non-portable -march=native
	sed -i 's|-march=native -mtune=native ||' c_src/Makefile || die
}

src_compile() {
	mkdir -p priv obj
	emake -C c_src \
		PRIV_DIR="${S}/priv" OBJ_DIR="${S}/obj" \
		HAVE_JQ=$(usex jq 1 0)
	rebar3_src_compile
}

src_install() {
	rebar3_src_install
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/glazer.so
}
