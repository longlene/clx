# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

REBAR_APP_SRC="src/hash_ring.app.src"

inherit rebar3

DESCRIPTION="Consistent hash ring implementation"
HOMEPAGE="https://github.com/sile/hash_ring"
SRC_URI="https://github.com/sile/hash_ring/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/hash_ring-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	pushd "_build/${REBAR_PROFILE}" >/dev/null || die
	rebar3_install_lib lib/hash_ring
	popd >/dev/null || die
	einstalldocs
}
