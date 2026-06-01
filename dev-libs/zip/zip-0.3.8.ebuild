# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A portable, simple zip library written in C"
HOMEPAGE="https://github.com/kuba--/zip"
SRC_URI="https://github.com/kuba--/zip/archive/v${PV}.tar.gz -> kuba-${P}.gh.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_TESTING=ON
	)
	cmake_src_configure
}
