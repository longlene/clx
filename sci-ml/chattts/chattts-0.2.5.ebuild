# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Generative speech model for daily dialogue"
HOMEPAGE="https://github.com/2noise/ChatTTS"
SRC_URI="https://github.com/2noise/ChatTTS/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/ChatTTS-${PV}"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=sci-ml/pytorch-2.1.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.41.1[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchaudio[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		<dev-python/numpy-3.0.0[${PYTHON_USEDEP}]
		dev-python/numba[${PYTHON_USEDEP}]
		dev-python/pybase16384[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/vocos[${PYTHON_USEDEP}]
		sci-ml/vector-quantize-pytorch[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	sed -i "s|version = \"v0.0.0\"|version = \"v${PV}\"|" setup.py || die
	distutils-r1_src_prepare
}
