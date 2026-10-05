# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Fast computation of PyTorch model FLOPs and parameters"
HOMEPAGE="
	https://github.com/ultralytics/thop
	https://pypi.org/project/ultralytics-thop/
"
SRC_URI="https://github.com/ultralytics/thop/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/thop-${PV}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
	')
"

EPYTEST_PLUGINS=()

distutils_enable_tests pytest
