# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="PyTorch media decoding and encoding"
HOMEPAGE="
	https://github.com/pytorch/torchcodec
	http://meta-pytorch.org/torchcodec/
"
SRC_URI="https://github.com/pytorch/torchcodec/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda"
RESTRICT="test"

DEPEND="
	>=sci-ml/pytorch-2.5.0[${PYTHON_SINGLE_USEDEP}]
	media-video/ffmpeg
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	$(python_gen_cond_dep '
		dev-python/pybind11[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	eapply "${FILESDIR}"/${P}-mkl-gnu-thread.patch
	distutils-r1_src_prepare
}

python_compile() {
	local -x BUILD_VERSION=${PV}
	local -x I_CONFIRM_THIS_IS_NOT_A_LICENSE_VIOLATION=1
	local -x TORCHCODEC_DISABLE_COMPILE_WARNING_AS_ERROR=ON
	use cuda && local -x ENABLE_CUDA=ON
	distutils-r1_python_compile
}
