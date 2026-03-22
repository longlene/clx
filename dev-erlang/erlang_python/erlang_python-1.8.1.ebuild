# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Execute Python applications from Erlang using dirty NIFs"
HOMEPAGE="https://github.com/benoitc/erlang-python"
SRC_URI="https://github.com/benoitc/erlang-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/erlang-python-${PV}

src_install() {
	rebar3_src_install
	insinto "$(get_erl_libs)/${P}"
	doins -r priv
}
