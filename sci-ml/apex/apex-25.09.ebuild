# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A PyTorch Extension"
HOMEPAGE="
	https://github.com/NVIDIA/apex
"
SRC_URI="https://github.com/NVIDIA/apex/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="test"

REQUIRED_USE=${PYTHON_REQUIRED_USE}
RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="${RDEPEND}
	sci-ml/caffe2[cuda,${PYTHON_SINGLE_USEDEP}]
	dev-util/nvidia-cuda-toolkit
"

python_compile() {
	APEX_CPP_EXT=1 \
	APEX_CUDA_EXT=1 \
	distutils-r1_python_compile develop sdist
}

