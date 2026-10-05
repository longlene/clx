# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PN="cudnn-frontend"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="cuDNN Frontend: Python bindings for the cuDNN C++ frontend API"
HOMEPAGE="
	https://github.com/NVIDIA/cudnn-frontend
	https://pypi.org/project/nvidia-cudnn-frontend/
"
SRC_URI="https://github.com/NVIDIA/cudnn-frontend/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
# tests need a GPU
RESTRICT="test"

RDEPEND="
	>=dev-libs/cudnn-9.0.0:=
	>=dev-python/nvidia-cutlass-dsl-4.6.2[${PYTHON_USEDEP}]
	>=sci-ml/tvm-ffi-0.1.11[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	>=sci-libs/dlpack-1.3
"
BDEPEND="
	dev-python/pybind11[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}"/${P}-system-dlpack.patch
)

src_prepare() {
	distutils-r1_src_prepare

	# sci-libs/dlpack-1.3 installs a CMake config still versioned 0.6;
	# the version is enforced by DEPEND instead
	sed -i -e "s/find_package(dlpack 1.3 REQUIRED)/find_package(dlpack REQUIRED)/" \
		python/CMakeLists.txt || die
}

python_compile() {
	local -x CUDNN_FRONTEND_USE_SYSTEM_DLPACK=ON
	distutils-r1_python_compile
}
