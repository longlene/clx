# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="Intel(R) Math Kernel Library for Deep Neural Networks (Intel(R) MKL-DNN)"
HOMEPAGE="https://www.oneapi.io/open-source/"
SRC_URI="https://github.com/oneapi-src/oneDNN/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+mkl"

DEPEND="
	mkl? ( sci-libs/mkl )
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e "/install(FILES/{s#\${DNNL_LIBRARY_NAME}#${P}#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DDNNL_BUILD_EXAMPLES=OFF
		-DDNNL_BUILD_TESTS=OFF
	)
	use mkl && mycmakeargs+=( -DBLA_VENDOR="Intel10_64_dya" -DDNNL_BLAS_VENDOR="MKL" )
	cmake_src_configure
}
