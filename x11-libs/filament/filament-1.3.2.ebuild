# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="A real-time physically based rendering engine"
HOMEPAGE="https://github.com/google/filament"
SRC_URI="https://github.com/google/filament/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DENABLE_JAVA=OFF
	)
	cmake-utils_src_configure
}
