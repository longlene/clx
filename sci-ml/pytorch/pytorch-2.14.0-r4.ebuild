# Copyright 2022-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )
inherit python-single-r1

DESCRIPTION="Tensors and Dynamic neural networks in Python"
HOMEPAGE="https://pytorch.org/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

REQUIRED_USE=${PYTHON_REQUIRED_USE}

# sci-ml/caffe2 builds the full torch Python package (compiled torch._C
# and libtorch* alongside the pure-Python torch/torchgen/functorch tree)
# from the same pytorch source tree; this package is kept only so the
# many consumers depending on sci-ml/pytorch by name keep working.
RDEPEND="
	${PYTHON_DEPS}
	~sci-ml/caffe2-${PV}[${PYTHON_SINGLE_USEDEP}]
"

S="${WORKDIR}"
