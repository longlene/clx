# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Use pretrained transformers like BERT, XLNet and GPT-2 in spaCy"
HOMEPAGE="
	https://pypi.org/project/spacy-transformers/
	https://github.com/explosion/spacy-transformers
	https://spacy.io/usage/embeddings-transformers
"
SRC_URI="https://github.com/explosion/spacy-transformers/archive/refs/tags/release-v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/spacy-transformers-release-v${PV}
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/transformers-4.45.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-1.8.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/spacy-3.5.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.19.0[${PYTHON_USEDEP}]
		>=dev-python/srsly-2.4.0[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.4.0[${PYTHON_USEDEP}]
		>=dev-python/spacy-alignments-0.7.2[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/cython-0.25[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
