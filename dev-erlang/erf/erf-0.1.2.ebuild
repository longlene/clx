# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A design-first Erlang REST Framework"
HOMEPAGE="https://github.com/nomasystems/erf"
SRC_URI="https://github.com/nomasystems/erf/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/elli
	dev-erlang/ndto
	>=dev-erlang/njson-2.0.0
"

src_prepare() {
	rebar3_src_prepare

	# rebar3_ndto plugin fetches from git and generates DTOs from OAS specs.
	# Remove the plugin and its pre-compile hook; skip DTO code generation.
	gawk -i inplace '
	/^\{plugins,/, /\}[[:space:]]*\.$/ { next }
	/^\{provider_hooks,/, /\}[[:space:]]*\.$/ { next }
	1
	' rebar.config || die

	# rebar.config.script checks for _gen/dtos/ at configure time
	mkdir -p _gen/dtos || die
}
