# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Retrieval and retrieval-augmented LLMs toolkit"
HOMEPAGE="https://github.com/FlagOpen/FlagEmbedding"
SRC_URI="https://github.com/FlagOpen/FlagEmbedding/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/FlagEmbedding-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-1.6.0
	>=sci-ml/transformers-4.44.2
	<sci-ml/transformers-6.0.0
	>=sci-ml/datasets-2.19.0
	>=sci-ml/accelerate-0.20.1
	sci-ml/sentence-transformers
	sci-ml/peft
	$(python_gen_cond_dep '
		dev-python/ir-datasets[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
	')
"
