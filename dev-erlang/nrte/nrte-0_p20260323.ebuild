# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

EGIT_COMMIT="9d70903a55361a0a32901df1eb80f9a40f95a1c5"

DESCRIPTION="OTP library to send and receive real-time events over HTTP connections"
HOMEPAGE="https://github.com/nomasystems/nrte"
SRC_URI="https://github.com/nomasystems/nrte/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/nrte-${EGIT_COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/cowboy
	dev-erlang/erlbus
"
DEPEND="${RDEPEND}"

src_prepare() {
	rebar3_src_prepare
	# project_plugins (erlfmt, gradualizer) are dev tools not needed at build time
	sed -i '/^{project_plugins,/,/^\]}\./d' rebar.config || die
}

src_install() {
	rebar3_src_install
	# priv/ in _build is a symlink; install runtime HTML resource manually
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/*.html
}
