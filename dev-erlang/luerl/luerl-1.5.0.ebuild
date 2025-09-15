# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="An implementation of Lua in Erlang"
HOMEPAGE="https://github.com/rvirding/luerl"
SRC_URI="https://github.com/rvirding/${PN}/archive/v${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm ~ia64 ppc ~sparc x86"

DEPEND=">=dev-lang/erlang-24.0"
RDEPEND="${DEPEND}"

DOCS=( README.md )

src_prepare() {
	default
	sed -e 's#{include_erts, true}#{include_erts, false}#' \
		-i rebar.config
	rebar3_src_prepare
}

rebar3_install_release() {
	mkdir -p "${ED}"/opt/luerl || die
	cp -pR bin lib releases "${ED}"/opt/luerl/ || die

	dosym -r /opt/luerl/bin/luerl /usr/bin/luerl
}

src_install() {
	rebar3_src_install
	rebar3_install_lib _build/default/lib/luerl
}
