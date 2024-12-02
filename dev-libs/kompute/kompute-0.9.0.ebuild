# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="The general purpose GPU compute framework for cross vendor graphics cards"
HOMEPAGE="
	http://kompute.cc/
	https://github.com/KomputeProject/kompute/
"
SRC_URI="https://github.com/KomputeProject/kompute/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libfmt
	media-libs/vulkan-loader
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DKOMPUTE_OPT_USE_BUILT_IN_VULKAN_HEADER=OFF
		-DKOMPUTE_OPT_DISABLE_VULKAN_VERSION_CHECK=ON
		-DKOMPUTE_OPT_USE_BUILT_IN_FMT=OFF
		-DKOMPUTE_OPT_USE_BUILT_IN_GOOGLE_TEST=OFF
		-DKOMPUTE_OPT_USE_BUILT_IN_PYBIND11=OFF
		-DKOMPUTE_OPT_USE_BUILT_IN_VULKAN_HEADER=OFF
	)
	cmake_src_configure
}
