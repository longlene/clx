# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit cmake distutils-r1

DESCRIPTION="Intel Extension for PyTorch"
HOMEPAGE="
	https://pypi.org/project/intel-extension-for-pytorch/
	https://github.com/intel/intel-extension-for-pytorch
"
SRC_URI="https://github.com/intel/intel-extension-for-pytorch/archive/refs/tags/v${PV}+xpu.tar.gz -> ${P}+xpu.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-libs/pytorch[${PYTHON_SINGLE_USEDEP}]
	~sci-libs/ipex-${PV}[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pybind11[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${P}-xpu

IPEX_VERSION="${PV}"
export EXT_DIR="${WORKDIR}"/${P}-xpu_build/intel_extension_for_pytorch/csrc/

src_prepare() {
	default
	eapply "${FILESDIR}"/system-python.patch
	eapply "${FILESDIR}"/setup-fix.patch
	eapply "${FILESDIR}"/version-header.patch
	eapply "${FILESDIR}"/install-path.patch
	ln -sv "${FILESDIR}"/FindIntelSYCL.cmake cmake/Modules/FindIntelSYCL.cmake
	cmake_src_prepare
	distutils-r1_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DIPEX_PROJ_NAME="${PN}"
		-DCMAKE_PROJECT_VERSION="$(ver_cut 1-3)"
		-DBUILD_MODULE_TYPE="PYTHON"
		-DCMAKE_INSTALL_LIBDIR=$(get_libdir)
		-DBUILD_STATIC_ONEMKL=OFF
	)
	cmake_src_configure
	distutils-r1_src_configure
}

src_compile() {
	cmake_src_compile
	distutils-r1_src_compile
}

src_install() {
	cmake_src_install
	distutils-r1_src_install
}
