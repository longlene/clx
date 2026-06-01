# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

COMMIT="3f5f5e87562f5c6918467c713340581aa026720e"

DESCRIPTION="Lightweight library for PyTorch training tools and utilities"
HOMEPAGE="https://github.com/meta-pytorch/tnt"
SRC_URI="https://github.com/meta-pytorch/tnt/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/tnt-${COMMIT}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.3.0
	>=sci-ml/tensorboard-2.20.0
	$(python_gen_cond_dep '
		>=dev-python/fsspec-2024.1[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
		>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.9[${PYTHON_USEDEP}]
		>=dev-python/pyre-extensions-0.0.32[${PYTHON_USEDEP}]
		>=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
