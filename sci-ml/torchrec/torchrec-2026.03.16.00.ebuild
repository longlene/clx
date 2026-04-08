# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools

PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Pytorch domain library for recommendation systems"
HOMEPAGE="
	https://pypi.org/project/torchrec/
	https://github.com/meta-pytorch/torchrec
"
SRC_URI="https://github.com/meta-pytorch/torchrec/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/FBGEMM
	sci-ml/tensordict[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchmetrics-1.0.3[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/pyre-extensions[${PYTHON_USEDEP}]
		dev-python/iopath[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
