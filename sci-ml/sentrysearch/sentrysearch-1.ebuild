# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Semantic search over videos using Gemini Embedding 2 or Qwen3-VL"
HOMEPAGE="https://github.com/ssrajadh/sentrysearch"
SRC_URI="https://github.com/ssrajadh/sentrysearch/archive/refs/tags/benchmark-clip-v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/sentrysearch-benchmark-clip-v${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cloud"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/click-8.1[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0[${PYTHON_USEDEP}]
	sci-ml/chromadb[${PYTHON_USEDEP}]
	>=dev-python/google-genai-1.0[${PYTHON_USEDEP}]
	dev-python/imageio-ffmpeg[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.0[${PYTHON_USEDEP}]
	cloud? ( >=dev-python/dashscope-1.25.17[${PYTHON_USEDEP}] )
')"
