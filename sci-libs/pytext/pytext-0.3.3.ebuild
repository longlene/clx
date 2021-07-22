# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
inherit distutils-r1

DESCRIPTION="A natural language modeling framework based on PyTorch"
HOMEPAGE="https://github.com/facebookresearch/pytext"
SRC_URI="https://github.com/facebookresearch/pytext/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/click
	dev-python/fairseq
	dev-python/future
	dev-python/hypothesis
	dev-python/iopath
	dev-python/joblib
	dev-python/numpy
	>=dev-python/onnx-1.6.0
	dev-python/pandas
	dev-python/transformers
	dev-python/regex
	dev-python/requests
	dev-python/scipy
	dev-python/sentencepiece
	dev-python/tensorboard
	sci-libs/pytorch
	sci-libs/torchtext
"
BDEPEND=""
