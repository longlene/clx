# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="gRPC client library for Erlang/OTP built on top of gun"
HOMEPAGE="https://github.com/belltoy/egrpc"
SRC_URI="https://github.com/belltoy/egrpc/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-erlang/gun"

src_prepare() {
	# Remove project plugins; generated proto code is pre-committed to the repo
	perl -i -0pe 's/\{project_plugins,\s*\[.*?\]\}\./\{project_plugins, []\}./s' \
		rebar.config || die
	rebar3_src_prepare
}

src_install() {
	rebar3_src_install
	# include/ in the build tree is a symlink — install headers manually
	insinto "$(get_erl_libs)/${P}/include"
	doins "${S}"/include/*.hrl
}
