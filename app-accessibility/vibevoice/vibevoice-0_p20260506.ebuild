# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Open-source frontier voice AI with ASR, TTS and voice cloning"
HOMEPAGE="
	https://github.com/microsoft/VibeVoice
	https://microsoft.github.io/VibeVoice/
"
SRC_URI="https://github.com/microsoft/VibeVoice/archive/303b2833e01cff4578ec278bbfe536da54bd19fe.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/VibeVoice-303b2833e01cff4578ec278bbfe536da54bd19fe"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.51.3[${PYTHON_SINGLE_USEDEP}]
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	sci-ml/diffusers[${PYTHON_SINGLE_USEDEP}]
	dev-python/gradio[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/llvmlite[${PYTHON_USEDEP}]
		dev-python/numba[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		dev-python/absl-py[${PYTHON_USEDEP}]
		dev-python/av[${PYTHON_USEDEP}]
		dev-python/aiortc[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/pydub[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	')
"
BDEPEND="$(python_gen_cond_dep 'dev-python/setuptools[${PYTHON_USEDEP}]')"
