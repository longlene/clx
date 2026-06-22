# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Open-source AI memory system with retrieval and MCP server support"
HOMEPAGE="https://github.com/MemPalace/mempalace"
SRC_URI="https://github.com/MemPalace/mempalace/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

# huggingface_hub and tokenizers are single-impl; list at top level without
# Python USE constraints per the multi/single-impl boundary rule
RDEPEND="
	sci-ml/huggingface_hub
	sci-ml/tokenizers
	$(python_gen_cond_dep '
		>=sci-ml/chromadb-1.5.4[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.8[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	')
"

DOCS=( README.md CHANGELOG.md )
