# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

inherit cmake flag-o-matic python-single-r1

MY_PN="intel-extension-for-pytorch"
MY_P=${MY_PN}-${PV}

DESCRIPTION="Intel Extension for PyTorch"
HOMEPAGE="https://github.com/intel/intel-extension-for-pytorch"
SRC_URI="
	https://github.com/intel/intel-extension-for-pytorch/archive/refs/tags/v${PV}+xpu.tar.gz -> ${MY_P}+xpu.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="sycl"

DEPEND="
	dev-libs/sleef
	sci-libs/ideep
	dev-libs/libxsmm
	dev-libs/oneDNN
	sci-libs/caffe2[distributed,${PYTHON_SINGLE_USEDEP}]
	sci-libs/mkl
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${MY_P}-xpu

IPEX_VERSION="${PV}"

src_prepare() {
	default
	eapply "${FILESDIR}"/system-onednn.patch
	eapply "${FILESDIR}"/system-python.patch
	eapply "${FILESDIR}"/system-sleef.patch
	eapply "${FILESDIR}"/system-libxsmm.patch
	eapply "${FILESDIR}"/setup-fix.patch
	eapply "${FILESDIR}"/version-header.patch
	eapply "${FILESDIR}"/install-path.patch
	ln -sv "${FILESDIR}"/FindIntelSYCL.cmake cmake/Modules/FindIntelSYCL.cmake
	cmake_src_prepare
}

src_configure() {
	local mode="CPU"
	if use sycl ; then
		export CC=icx
		export CXX=icpx
		filter-flags '-mabm'
		mode="GPU"
	fi

	local mycmakeargs=(
		-DIPEX_PROJ_NAME="${PN}"
		-DCMAKE_PROJECT_VERSION="$(ver_cut 1-3)"
		-DCMAKE_INSTALL_LIBDIR=$(get_libdir)
		-DBUILD_MODULE_TYPE="${mode}"
		-DBUILD_STATIC_ONEMKL=OFF
	)
	cmake_src_configure
}
