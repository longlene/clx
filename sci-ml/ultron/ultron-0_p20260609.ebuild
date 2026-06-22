# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Collective intelligence system with shared memories and skills for agents"
HOMEPAGE="https://github.com/modelscope/ultron"
COMMIT="6435b4b884d06054692d74a0b1eee7abb172bb00"
SRC_URI="https://github.com/modelscope/ultron/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=sci-ml/transformers-4.51.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/sentence-transformers-2.7.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/fastapi-0.100.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.22.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/dashscope-1.14.0[${PYTHON_USEDEP}]
		>=dev-python/openai-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.5.0[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.0[${PYTHON_USEDEP}]
		>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
		>=dev-python/bcrypt-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/presidio-analyzer-2.2.354[${PYTHON_USEDEP}]
		>=dev-python/presidio-anonymizer-2.2.362[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	rm -rf tests
	distutils-r1_src_prepare
}
