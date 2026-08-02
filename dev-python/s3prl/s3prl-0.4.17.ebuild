# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Self-Supervised Speech Pre-training and Representation Learning Toolkit"
HOMEPAGE="https://github.com/s3prl/s3prl"
SRC_URI="https://github.com/s3prl/s3prl/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

src_prepare() {
	sed -i 's/data_files=\[.*\],/data_files=[],/' setup.py || die
	distutils-r1_src_prepare
}

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchaudio-0.8.0[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/tqdm-4.56.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.21[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.4.1[${PYTHON_USEDEP}]
		dev-python/filelock[${PYTHON_USEDEP}]
		>=dev-python/omegaconf-2.1.1[${PYTHON_USEDEP}]
		>=dev-python/setuptools-65.5.1[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		>=dev-python/protobuf-4.21.1[${PYTHON_USEDEP}]
	')
"
