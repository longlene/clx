# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Run your own AI cluster at home with everyday devices"
HOMEPAGE="https://github.com/exo-explore/exo"
SRC_URI="https://github.com/exo-explore/exo/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/huggingface_hub-1.8.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-5.6.2[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.12.14[${PYTHON_USEDEP}]
		>=dev-python/types-aiofiles-24.1.0.20250708[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.11.7[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.116.1[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.18.0[${PYTHON_USEDEP}]
		>=dev-python/rustworkx-0.17.1[${PYTHON_USEDEP}]
		>=dev-python/psutil-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
		sci-ml/exo-pyo3-bindings[${PYTHON_USEDEP}]
		>=dev-python/anyio-4.11.0[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/hypercorn-0.18.0[${PYTHON_USEDEP}]
		>=dev-python/openai-harmony-0.0.8[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
		>=dev-python/tomlkit-0.14.0[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.21[${PYTHON_USEDEP}]
		>=dev-python/msgspec-0.19.0[${PYTHON_USEDEP}]
		>=dev-python/zstandard-0.23.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/uv-build[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest

RESTRICT="test"

#src_prepare() {
#	default
#	mv main.py exo-py
#	sed -e '/extras_require=extras_require,/a scripts=["exo-py"]' \
#		-i setup.py
#}

