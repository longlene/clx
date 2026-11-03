# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="6d4d7eb6b99011d5aab6e88a9b99e8fd4d86c6e9"

DESCRIPTION="Micro QuickJS Javascript Engine"
HOMEPAGE="https://github.com/bellard/mquickjs"
SRC_URI="https://github.com/bellard/mquickjs/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${PN}-${EGIT_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"

RESTRICT="!test? ( test )"

RDEPEND="${DEPEND}"

src_test() {
	emake test
}

src_install() {
	dobin mqjs
	einstalldocs
}
