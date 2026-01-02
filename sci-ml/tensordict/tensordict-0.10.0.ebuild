# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="TensorDict is a pytorch dedicated tensor container"
HOMEPAGE="https://github.com/pytorch/tensordict"
SRC_URI="https://github.com/pytorch/tensordict/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=sci-ml/pytorch-2.5.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/cloudpickle[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/importlib-metadata[${PYTHON_USEDEP}]
		dev-python/pyvers[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_TENSORDICT="${PV}"
