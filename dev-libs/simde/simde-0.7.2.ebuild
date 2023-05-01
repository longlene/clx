# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="SIMD Everywhere"
HOMEPAGE="https://github.com/simd-everywhere/simde"
SRC_URI="https://github.com/simd-everywhere/simde/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local emesonargs=(
		-Dtests=false
	)
	meson_src_configure
}
