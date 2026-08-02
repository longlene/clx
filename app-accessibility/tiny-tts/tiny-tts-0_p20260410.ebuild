# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

# No upstream tags; use commit hash for snapshot version
COMMIT="77c278f7a4659181bd7bcf5c5e07c768ae765147"

DESCRIPTION="The Smallest English TTS Model with only 1M parameters"
HOMEPAGE="https://github.com/tronghieuit/tiny-tts"
SRC_URI="https://github.com/tronghieuit/tiny-tts/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/tiny-tts-${COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchaudio[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/soundfile[${PYTHON_USEDEP}]
		dev-python/g2p-en[${PYTHON_USEDEP}]
		dev-python/numba[${PYTHON_USEDEP}]
	')
	media-libs/libsndfile
"
BDEPEND=""

distutils_enable_tests pytest
