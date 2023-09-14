# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Light, zero-dependency framework"
HOMEPAGE="https://oatpp.io"
SRC_URI="https://github.com/oatpp/oatpp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DOATPP_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
