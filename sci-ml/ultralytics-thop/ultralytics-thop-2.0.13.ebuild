# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Ultralytics THOP package for fast computation of PyTorch model FLOPs and"
HOMEPAGE="
	https://github.com/ultralytics/thop
"
SRC_URI="https://github.com/ultralytics/thop/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
S="${WORKDIR}"/thop-${PV}
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/pytorch[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"
