# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Machine learning, conversational dialog engine for creating chat bots"
HOMEPAGE="http://docs.chatterbot.us/ https://github.com/gunthercox/ChatterBot"
SRC_URI="https://github.com/gunthercox/ChatterBot/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/ChatterBot-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mongodb redis"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/mathparse[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0[${PYTHON_USEDEP}]
		dev-python/spacy[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		mongodb? ( dev-python/pymongo[${PYTHON_USEDEP}] )
		redis? (
			dev-python/redis[${PYTHON_USEDEP}]
			dev-python/langchain-redis[${PYTHON_USEDEP}]
			dev-python/langchain-huggingface[${PYTHON_USEDEP}]
			dev-python/sentence-transformers[${PYTHON_USEDEP}]
		)
	')
	redis? ( sci-ml/accelerate )
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
