# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="OTP application connecting a node to the braidnet orchestrator"
HOMEPAGE="https://github.com/stritzinger/braidnode"
SRC_URI="https://github.com/stritzinger/braidnode/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/gun
	dev-erlang/uuid-erl
"

src_prepare() {
	sed -i 's/{vsn, semver}/{vsn, "'"${PV}"'"}/' src/braidnode.app.src || die
	# Remove build-only plugins not needed for library compilation
	sed -i '/^{plugins/,/^]}\./d' rebar.config || die
	rebar3_src_prepare
}

src_compile() {
	erebar3 compile || die
}

src_install() {
	rebar3_src_install
	# priv/ in _build/ is a symlink — install from source tree manually
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins -r "${S}"/priv/.
}
