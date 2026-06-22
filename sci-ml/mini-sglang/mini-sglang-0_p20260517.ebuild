# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Compact implementation of SGLang for demystifying LLM serving systems"
HOMEPAGE="https://github.com/sgl-project/mini-sglang"
COMMIT="9a91cfafe754aa85daee49998176275667eb58f2"
SRC_URI="https://github.com/sgl-project/mini-sglang/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/mini-sglang-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/fastapi[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
	dev-python/openai[${PYTHON_USEDEP}]
	dev-python/prompt-toolkit[${PYTHON_USEDEP}]
	dev-python/pyzmq[${PYTHON_USEDEP}]
	dev-python/uvicorn[${PYTHON_USEDEP}]
	sci-ml/accelerate[${PYTHON_USEDEP}]
	sci-ml/modelscope[${PYTHON_USEDEP}]
	>=sci-ml/pytorch-2.0.0[${PYTHON_USEDEP}]
	>=sci-ml/transformers-4.56.0[${PYTHON_USEDEP}]
"
