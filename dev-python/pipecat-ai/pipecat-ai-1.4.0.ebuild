# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Open source framework for voice and multimodal conversational AI"
HOMEPAGE="
	https://pipecat.ai
	https://github.com/pipecat-ai/pipecat
"
SRC_URI="https://github.com/pipecat-ai/pipecat/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/pipecat-${PV}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.11.12[${PYTHON_USEDEP}]
	dev-python/audioop-lts[${PYTHON_USEDEP}]
	>=dev-python/docstring-parser-0.16[${PYTHON_USEDEP}]
	>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.7[${PYTHON_USEDEP}]
	>=dev-python/nltk-3.9.4[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
	>=dev-python/pillow-11.1.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.29.6[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10.6[${PYTHON_USEDEP}]
	dev-python/pyloudnorm[${PYTHON_USEDEP}]
	>=dev-python/resampy-0.4.3[${PYTHON_USEDEP}]
	>=dev-python/soxr-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/openai-1.74.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.9[${PYTHON_USEDEP}]
	>=dev-python/numba-0.61.2[${PYTHON_USEDEP}]
	>=dev-python/websockets-13.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-include-1.4[${PYTHON_USEDEP}]
	>=dev-python/onnxruntime-1.24.2[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-scm-8[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

python_compile() {
	SETUPTOOLS_SCM_PRETEND_VERSION=${PV} distutils-r1_python_compile
}
