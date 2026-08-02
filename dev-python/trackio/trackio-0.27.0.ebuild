# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Lightweight, local-first experiment tracking library from Hugging Face"
HOMEPAGE="https://github.com/gradio-app/trackio"
SRC_URI="https://github.com/gradio-app/trackio/archive/refs/tags/trackio@${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/trackio-trackio-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/huggingface_hub-1.10.0[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/gradio-client-2.0.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/starlette[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.9[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.30.0[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/orjson[${PYTHON_USEDEP}]
	')
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

python_compile() {
	SKIP_FRONTEND_BUILD=1 distutils-r1_python_compile
}
