# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit distutils-r1

DESCRIPTION="Fourier-based neural vocoder for high-quality audio synthesis"
HOMEPAGE="https://github.com/gemelo-ai/vocos"
SRC_URI="https://github.com/gemelo-ai/vocos/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-libs/pytorch[${PYTHON_USEDEP}]
	sci-libs/torchaudio[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/einops[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/huggingface_hub[${PYTHON_USEDEP}]
	dev-python/encodec[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"
