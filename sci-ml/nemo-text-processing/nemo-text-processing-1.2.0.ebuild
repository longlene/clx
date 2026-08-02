# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="r${PV}"

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="NeMo text processing for ASR and TTS normalization"
HOMEPAGE="
	https://github.com/NVIDIA/NeMo-text-processing
	https://docs.nvidia.com/deeplearning/nemo/user-guide/docs/en/stable/
"
SRC_URI="https://github.com/NVIDIA/NeMo-text-processing/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/NeMo-text-processing-${MY_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/editdistance[${PYTHON_USEDEP}]
		dev-python/inflect[${PYTHON_USEDEP}]
		dev-python/joblib[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		>=dev-python/sacremoses-0.0.43[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.41.0[${PYTHON_USEDEP}]
		dev-python/wget[${PYTHON_USEDEP}]
		dev-python/wrapt[${PYTHON_USEDEP}]
		dev-python/cdifflib[${PYTHON_USEDEP}]
		dev-python/pynini[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	rm -rf tests
	distutils-r1_src_prepare
}
