# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="A text-to-speech (TTS), speech-to-text (STT) and speech-to-speech (STS) library"
HOMEPAGE="https://github.com/Blaizzy/mlx-audio"
SRC_URI="
	https://github.com/Blaizzy/mlx-audio/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=sci-ml/huggingface_hub-1.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-5.0.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/mlx-lm-0.31.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/mlx-0.25.2[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.2[${PYTHON_USEDEP}]
		>=dev-python/sounddevice-0.5.3[${PYTHON_USEDEP}]
		>=dev-python/miniaudio-1.61[${PYTHON_USEDEP}]
		>=dev-python/pyloudnorm-0.2.0[${PYTHON_USEDEP}]
		>=dev-python/librosa-0.11.0[${PYTHON_USEDEP}]
		>=dev-python/protobuf-6.33.5[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest

RESTRICT="test"

