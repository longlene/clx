# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Speech processing recipes using k2 and Lhotse"
HOMEPAGE="https://k2-fsa.github.io/icefall/ https://github.com/k2-fsa/icefall"
SRC_URI="https://github.com/k2-fsa/icefall/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# TODO: dev-python/kaldilm and dev-python/kaldialign are not yet packaged.
RDEPEND="
	sci-ml/tensorboard
	$(python_gen_cond_dep '
		dev-python/dill[${PYTHON_USEDEP}]
		dev-python/kaldifst[${PYTHON_USEDEP}]
		dev-python/typeguard[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[python(+),${PYTHON_USEDEP}]
	')
"
