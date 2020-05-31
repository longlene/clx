# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

DESCRIPTION="Optimized inference engine for OpenNMT models"
HOMEPAGE="https://github.com/OpenNMT/CTranslate2"
SRC_URI="https://github.com/OpenNMT/CTranslate2/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sci-libs/mkl
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DWITH_TENSORRT=OFF
	)
	cmake-utils_src_configure
}

