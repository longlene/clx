# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Real-time web framework for Erlang"
HOMEPAGE="https://github.com/arizona-framework/arizona"
SRC_URI="https://github.com/arizona-framework/arizona/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/cowboy
	dev-erlang/fs
"

src_prepare() {
	rebar3_src_prepare
	# {vsn, semver} needs the git checkout; hardcode the release version
	sed -i "s/{vsn, semver}/{vsn, \"${PV}\"}/" src/arizona.app.src || die
	sed -i 's/, warnings_as_errors//' rebar.config || die
}

src_install() {
	rebar3_src_install

	# include/ and priv/ in _build are symlinks and get skipped —
	# install manually (priv/static ships prebuilt JS assets)
	insinto "$(get_erl_libs)/${P}/include"
	doins "${S}"/include/*.hrl
	insinto "$(get_erl_libs)/${P}"
	doins -r "${S}"/priv
}
