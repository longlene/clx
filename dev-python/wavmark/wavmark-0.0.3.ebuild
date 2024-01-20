# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1 pypi

DESCRIPTION="AI-based Audio Watermarking Tool"
HOMEPAGE="https://github.com/wavmark/wavmark"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/librosa[${PYTHON_USEDEP}]
	dev-python/resampy[${PYTHON_USEDEP}]
	dev-python/huggingface_hub[${PYTHON_USEDEP}]
	sci-libs/pytorch[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT=test
