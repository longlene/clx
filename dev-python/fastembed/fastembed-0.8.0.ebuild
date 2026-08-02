# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Fast, light, accurate library built for retrieval embedding generation"
HOMEPAGE="https://github.com/qdrant/fastembed"
SRC_URI="https://github.com/qdrant/fastembed/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/loguru[${PYTHON_USEDEP}]
	dev-python/mmh3[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/py-rust-stemmers[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	sci-ml/huggingface_hub
	dev-python/onnxruntime
	sci-ml/tokenizers
"
