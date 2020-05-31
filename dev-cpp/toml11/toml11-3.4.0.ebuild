# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="TOML for Modern C++"
HOMEPAGE="https://github.com/ToruNiina/toml11"
SRC_URI="https://github.com/ToruNiina/toml11/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-Dtoml11_BUILD_TEST=OFF
	)
	cmake-utils_src_configure
}
