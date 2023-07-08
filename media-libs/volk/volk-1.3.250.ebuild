# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Meta loader for Vulkan API"
HOMEPAGE="https://github.com/zeux/volk"
SRC_URI="https://github.com/zeux/volk/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DVOLK_INSTALL=ON
	)
	cmake_src_configure
}
