# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="c17a131fe028b2e428b6e80a33d30bb4fa57b8df"

DESCRIPTION="Qwen-ASR python package"
HOMEPAGE="
	https://github.com/QwenLM/Qwen3-ASR
"
SRC_URI="
	https://github.com/QwenLM/Qwen3-ASR/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/transformers-4.57.6[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/accelerate-1.12.0[${PYTHON_SINGLE_USEDEP}]
	dev-python/gradio[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/nagisa-0.2.11[${PYTHON_USEDEP}]
		>=dev-python/soynlp-0.0.493[${PYTHON_USEDEP}]
		sci-ml/qwen-omni-utils[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]
		dev-python/sox[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/Qwen3-ASR-${EGIT_COMMIT}
