# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit cmake distutils-r1

DESCRIPTION="Accessible large language models via k-bit quantization for PyTorch"
HOMEPAGE="
	https://pypi.org/project/bitsandbytes/
	https://github.com/bitsandbytes-foundation/bitsandbytes
"
SRC_URI="https://github.com/bitsandbytes-foundation/bitsandbytes/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda"

RDEPEND="
	sci-libs/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-libs/caffe2[cuda?,${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.17.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

CMAKE_IN_SOURCE_BUILD=1

src_prepare() {
	default
	cmake_src_prepare
	distutils-r1_src_prepare
}

src_configure() {
	local mycmakeargs=()
	use cuda && mycmakeargs+=( -DCOMPUTE_BACKEND="cuda" )
	cmake_src_configure
	distutils-r1_src_configure
}

src_compile() {
	cmake_src_compile
	distutils-r1_src_compile
}

src_install() {
	distutils-r1_src_install
}
