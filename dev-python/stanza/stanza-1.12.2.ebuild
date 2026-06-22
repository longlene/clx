# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
inherit distutils-r1

DESCRIPTION="A Python NLP Library for Many Human Languages"
HOMEPAGE="https://stanfordnlp.github.io/stanza/"
SRC_URI="https://github.com/stanfordnlp/stanza/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="datasets transformers"
# Tests require downloading Stanford NLP models at runtime
RESTRICT="test"

# TODO: dev-python/udtools not yet in portage
RDEPEND="
	>=sci-ml/pytorch-1.13.0
	datasets? ( sci-ml/datasets )
	transformers? (
		sci-ml/peft
		sci-ml/transformers
	)
	$(python_gen_cond_dep '
		dev-python/emoji[${PYTHON_USEDEP}]
		dev-python/networkx[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/platformdirs[${PYTHON_USEDEP}]
		>=dev-python/protobuf-3.15.0[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	')
"
BDEPEND="test? ( $(python_gen_cond_dep '
	dev-python/coverage[${PYTHON_USEDEP}]
') )"

distutils_enable_tests pytest
