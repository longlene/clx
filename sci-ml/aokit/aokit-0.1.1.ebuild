# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Ahead-of-time compilation toolkit for PyTorch"
HOMEPAGE="https://github.com/huggingface/aokit"
SRC_URI="https://github.com/huggingface/aokit/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
# Tests require GPU hardware
RESTRICT="test"

RDEPEND="
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.8.0[${PYTHON_SINGLE_USEDEP}]
"
