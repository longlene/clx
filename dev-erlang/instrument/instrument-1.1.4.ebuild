# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang metrics library with Prometheus and OpenTelemetry support"
HOMEPAGE="https://github.com/benoitc/instrument"
SRC_URI="https://github.com/benoitc/instrument/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# hackney is only called at runtime (Erlang resolves inter-module calls lazily)
RDEPEND="dev-erlang/hackney"
BDEPEND="dev-build/cmake"

src_install() {
	rebar3_src_install
	# rebar3_install_lib skips symlinks, so priv/ and include/ are not installed
	# by the eclass. Install them from the source tree directly.
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/*.so
	insinto "${dest}/include"
	doins "${S}"/include/*.hrl
}
