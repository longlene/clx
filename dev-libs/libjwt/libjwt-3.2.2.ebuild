# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="JWT C Library"
HOMEPAGE="https://github.com/benmcollins/libjwt"
SRC_URI="https://github.com/benmcollins/libjwt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/jansson
	dev-libs/openssl
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DWITH_TESTS=OFF
	)
	cmake_src_configure
}
