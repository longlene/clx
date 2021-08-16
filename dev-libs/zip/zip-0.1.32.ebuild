# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="A portable, simple zip library written in C"
HOMEPAGE="https://github.com/kuba--/zip"
SRC_URI="https://github.com/kuba--/zip/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DCMAKE_DISABLE_TESTING=ON
	)
	cmake-utils_src_configure
}
