# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="7f31dc8fe521e99012ac863a946e10a314118c16"

DESCRIPTION="Computer vision models on PyTorch"
HOMEPAGE="https://github.com/osmr/pytorchcv"
SRC_URI="
	https://github.com/osmr/pytorchcv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	sci-libs/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-libs/torchvision[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

S="${WORKDIR}"/pytorchcv-${EGIT_COMMIT}

