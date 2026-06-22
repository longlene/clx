# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

EGIT_COMMIT="6ef4858b5446e05bd461d9658d877e548182dbcb"

DESCRIPTION="High-performance linear attention kernel library built on TileLang"
HOMEPAGE="https://github.com/QwenLM/FlashQLA"
SRC_URI="https://github.com/QwenLM/FlashQLA/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/FlashQLA-${EGIT_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=sci-ml/pytorch-2.8[${PYTHON_SINGLE_USEDEP}]
	>=dev-python/tilelang-0.1.8[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/tvm-ffi-0.1.9[${PYTHON_USEDEP}]
	')
"
