# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Unified utilities for MiniCPM-o, includes stepaudio2 and extensible utils"
HOMEPAGE="https://pypi.org/project/minicpmo-utils/"

S="${WORKDIR}/minicpmo_utils-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="tts"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		dev-python/decord[${PYTHON_USEDEP}]
		dev-python/moviepy[${PYTHON_USEDEP}]
	')
	tts? (
		>=sci-ml/pytorch-2.3.0
		>=sci-ml/torchaudio-2.3.0
		sci-ml/transformers
		$(python_gen_cond_dep '
			>=dev-python/onnxruntime-1.18.0[${PYTHON_USEDEP}]
			dev-python/onnx[${PYTHON_USEDEP}]
			dev-python/hyperpyyaml[${PYTHON_USEDEP}]
			>=dev-python/tqdm-4.66.0[${PYTHON_USEDEP}]
			dev-python/einops[${PYTHON_USEDEP}]
			>=dev-python/scipy-1.10.0[${PYTHON_USEDEP}]
			dev-python/soundfile[${PYTHON_USEDEP}]
		')
	)
"
