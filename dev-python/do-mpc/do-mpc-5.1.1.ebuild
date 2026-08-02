# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Robust multi-stage and multi-objective model predictive control toolbox"
HOMEPAGE="https://www.do-mpc.com"

S="${WORKDIR}/do_mpc-${PV}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="full"

RDEPEND="
	>=dev-python/casadi-3.6.0[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	full? (
		>=sci-ml/onnx-1.13.0[${PYTHON_USEDEP}]
		dev-python/ipykernel[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/asyncua[${PYTHON_USEDEP}]
		>=sci-ml/pytorch-2.0.0
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
