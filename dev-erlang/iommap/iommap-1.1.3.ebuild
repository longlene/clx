# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Memory-mapped file I/O NIF for Erlang"
HOMEPAGE="https://github.com/benoitc/erlang-iommap"
SRC_URI="https://github.com/benoitc/erlang-iommap/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/erlang-iommap-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-build/cmake"

src_prepare() {
	rebar3_src_prepare
	sed -i -e 's/,\s*warnings_as_errors//' -e 's/warnings_as_errors,\s*//' rebar.config || die
}

src_install() {
	rebar3_src_install
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/*.so
}
