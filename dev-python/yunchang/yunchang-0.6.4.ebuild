# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="Unified Sequence Parallel Attention for Long Context Training"
HOMEPAGE="https://github.com/feifeibear/long-context-attention"
SRC_URI="https://github.com/feifeibear/long-context-attention/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/long-context-attention-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="flash-attn"
RESTRICT="test"

src_prepare() {
	sed -i 's/exclude = \["tests\*/exclude = ["test*/' pyproject.toml || die
	distutils-r1_src_prepare
}

RDEPEND="
	>=sci-ml/pytorch-2.3.0[${PYTHON_SINGLE_USEDEP}]
	flash-attn? ( >=sci-ml/flash-attn-2.6.0[${PYTHON_SINGLE_USEDEP}] )
"
