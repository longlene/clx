# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Efficient and Effective Passage Search via Contextualized Late Interaction over BERT"
HOMEPAGE="
	https://pypi.org/project/colbert-ai/
"
SRC_URI="https://github.com/stanford-futuredata/ColBERT/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/bitarray[${PYTHON_USEDEP}]
		sci-ml/datasets[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/gitpython[${PYTHON_USEDEP}]
		dev-python/python-dotenv[${PYTHON_USEDEP}]
		dev-python/ninja[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/ujson[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/ColBERT-${PV}
