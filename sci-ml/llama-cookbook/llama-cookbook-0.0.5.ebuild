# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="The Official Guide to building with Llama Models"
HOMEPAGE="
	https://pypi.org/project/llama-cookbook/
	https://www.llama.com/
	https://github.com/meta-llama/llama-cookbook
"
SRC_URI="https://github.com/meta-llama/llama-cookbook/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/torch-2.2[${PYTHON_USEDEP}]
	sci-ml/accelerate[${PYTHON_USEDEP}]
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/loralib[${PYTHON_USEDEP}]
	sci-ml/bitsandbytes[${PYTHON_USEDEP}]
	dev-python/black[${PYTHON_USEDEP}]
	sci-ml/datasets[${PYTHON_USEDEP}]
	dev-python/fire[${PYTHON_USEDEP}]
	sci-ml/peft[${PYTHON_USEDEP}]
	>=sci-ml/transformers-4.45.1[${PYTHON_USEDEP}]
	sci-ml/sentencepiece[${PYTHON_USEDEP}]
	dev-python/py7zr[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	sci-ml/optimum[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/chardet[${PYTHON_USEDEP}]
	dev-python/openai[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	sci-ml/evaluate[${PYTHON_USEDEP}]
	dev-python/rouge-score[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
	dev-python/unstructured[${PYTHON_USEDEP}]
	sci-ml/sentence-transformers[${PYTHON_USEDEP}]
	dev-python/codeshield[${PYTHON_USEDEP}]
	dev-python/gradio[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-2.0.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
