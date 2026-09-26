# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Agent2Agent (A2A) protocol library for Erlang/OTP"
HOMEPAGE="https://github.com/barrel-platform/barrel_a2a"
SRC_URI="https://github.com/barrel-platform/barrel_a2a/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/barrel_a2a-${PV}"

RDEPEND="
	>=dev-erlang/h1-0.9.1
	>=dev-erlang/h2-0.12.0
	>=dev-erlang/hackney-4.7.4
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

REBAR_APP_SRC="src/barrel_a2a.app.src"

src_prepare() {
	rebar3_src_prepare
	sed -i -e 's/,\s*warnings_as_errors//' -e 's/warnings_as_errors,\s*//' rebar.config || die
	# project_plugins are dev tools not needed at build time and unfetchable
	# with HEX_OFFLINE=true.
	sed -i '/^{project_plugins,/,/^\]}.$/d' rebar.config || die
}

# App name is barrel_a2a (underscore), so rebar3_src_install's lib/${PN}
# lookup misses the built lib dir.
src_install() {
	pushd "${S}/_build/${REBAR_PROFILE}" >/dev/null || die
	rebar3_install_lib lib/barrel_a2a || die
	popd >/dev/null || die
	einstalldocs
}
