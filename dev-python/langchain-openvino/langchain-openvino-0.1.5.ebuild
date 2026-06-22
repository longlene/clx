# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="LangChain integration with OpenVINO GenAI for local inference"
HOMEPAGE="https://github.com/11happy/langchain-openvino"
SRC_URI="https://github.com/11happy/langchain-openvino/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/librosa[${PYTHON_USEDEP}]
	dev-python/pdoc[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	sci-ml/langchain-core[${PYTHON_USEDEP}]
	sci-ml/optimum-intel[${PYTHON_USEDEP}]
	sci-ml/openvino[${PYTHON_USEDEP}]
	sci-ml/openvino-genai[${PYTHON_USEDEP}]
	sci-ml/openvino-tokenizers[${PYTHON_USEDEP}]
"
