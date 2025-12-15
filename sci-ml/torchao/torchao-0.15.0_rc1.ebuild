# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )
inherit distutils-r1

MY_PV=${PV/_/-}
MY_P=${PN}-${MY_PV}

DESCRIPTION="PyTorch native quantization and sparsity for training and inference"
HOMEPAGE="https://github.com/pytorch/ao"
SRC_URI="https://github.com/pytorch/ao/archive/refs/tags/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
"
BDEPEND=""
RESTRICT="test"

S="${WORKDIR}"/ao-${MY_PV}

PATCHES=(
	"${FILESDIR}"/fix-build-order.patch
)

export USE_SYSTEM_LIBS=ON
#export MAX_JOBS=1
