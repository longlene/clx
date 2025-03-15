# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Datasets, Transforms and Models specific to Computer Vision"
HOMEPAGE="https://pytorch.org/vision"
SRC_URI="https://github.com/pytorch/vision/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda rocm"

DEPEND=""
RDEPEND="${DEPEND}
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
	')
	sci-ml/caffe2[cuda?,rocm?]
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	media-libs/libjpeg-turbo
	media-libs/libpng
	media-libs/libwebp
	media-video/ffmpeg
"
BDEPEND=""

distutils_enable_tests pytest


S="${WORKDIR}"/vision-${PV}

src_compile() {
	export MAKEOPTS=-j1
	use cuda && export NVCC_FLAGS="$(cuda_gccdir -f | tr -d \")"
	use rocm && addpredict /dev/kfd

	distutils-r1_src_compile
}
