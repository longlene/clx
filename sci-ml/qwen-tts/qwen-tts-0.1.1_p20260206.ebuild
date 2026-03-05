# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="6cafe5582caea83df269c36b1ce62d953a9cc66b"

DESCRIPTION="Qwen-TTS python package"
HOMEPAGE="
	https://github.com/QwenLM/Qwen3-TTS
"
SRC_URI="
	https://github.com/QwenLM/Qwen3-TTS/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/gradio[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.57.3[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-1.12.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchaudio[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/librosa[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]
		dev-python/sox[${PYTHON_USEDEP}]
		sci-libs/onnxruntime[${PYTHON_USEDEP}]
		dev-python/einops[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/Qwen3-TTS-${EGIT_COMMIT}
