# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Duktape JavaScript engine for Erlang"
HOMEPAGE="https://github.com/benoitc/erlang-duktape"
SRC_URI="https://github.com/benoitc/erlang-duktape/archive/refs/tags/${PV}.tar.gz -> erlang-${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/erlang-${P}
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

src_install() {
	rebar3_src_install
	insinto "$(get_erl_libs)/${P}"
	doins -r priv
}
