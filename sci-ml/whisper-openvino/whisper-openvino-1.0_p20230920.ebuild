# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="cc2f13074ff8a0cd43fe3f574285b2308baf55ec"

DESCRIPTION="openvino version of openai/whisper"
HOMEPAGE="
	https://github.com/zhuzilin/whisper-openvino
"
SRC_URI="https://github.com/zhuzilin/whisper-openvino/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/transformers-4.19.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/openvino-2023.1.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/pytorch[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/more-itertools[${PYTHON_USEDEP}]
		>=dev-python/ffmpeg-python-0.2.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
