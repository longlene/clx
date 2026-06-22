# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14,15} )

inherit rebar3 python-single-r1

DESCRIPTION="Execute Python applications from Erlang using dirty NIFs"
HOMEPAGE="https://github.com/benoitc/erlang-python"
SRC_URI="https://github.com/benoitc/erlang-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/erlang-python-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"
BDEPEND="dev-build/cmake"

pkg_setup() {
	python_setup
}

src_install() {
	rebar3_src_install
	insinto "$(get_erl_libs)/${P}"
	doins -r priv
}
