# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

REBAR_APP_SRC="src/leo_cache.app.src"

inherit rebar3

DESCRIPTION="Object caching server for RAM and disc (SSD)"
HOMEPAGE="https://github.com/leo-project/leo_cache"
SRC_URI="https://github.com/leo-project/leo_cache/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/leo_cache-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-erlang/leo-commons-2.0.1
	>=dev-erlang/leo-dcerl-0.4.10
	>=dev-erlang/leo-mcerl-0.6.8
	>=dev-erlang/leo-tran-2.0.0
"
# headers included via include_lib at compile time
DEPEND="
	>=dev-erlang/leo-dcerl-0.4.10
	>=dev-erlang/leo-mcerl-0.6.8
	>=dev-erlang/leo-tran-2.0.0
"

src_prepare() {
	rebar3_src_prepare
	# upstream pins ancient OTP releases; rebar3 aborts on mismatch
	sed -i '/require_otp_vsn/d' rebar.config || die
}

src_install() {
	# app dir is lib/leo_cache, not lib/${PN}
	pushd "_build/${REBAR_PROFILE}" >/dev/null || die
	rebar3_install_lib lib/leo_cache
	popd >/dev/null || die

	# include/ in _build is a symlink and gets skipped — install manually
	insinto "$(get_erl_libs)/${P}/include"
	doins "${S}"/include/*.hrl

	einstalldocs
}
