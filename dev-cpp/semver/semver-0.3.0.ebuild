# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Semantic Versioning for modern C++"
HOMEPAGE="https://github.com/Neargye/semver"
SRC_URI="https://github.com/Neargye/semver/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DSEMVER_OPT_BUILD_EXAMPLES=OFF
		-DSEMVER_OPT_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
