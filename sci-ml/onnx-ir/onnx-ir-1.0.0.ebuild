# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="ONNX IR: Python implementation of the ONNX intermediate representation"
HOMEPAGE="
	https://github.com/onnx/ir-py
	https://onnx.ai/ir-py
"
SRC_URI="https://github.com/onnx/ir-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/ir-py-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/ml-dtypes-0.5.0[${PYTHON_USEDEP}]
	>=sci-ml/onnx-1.16[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.10[${PYTHON_USEDEP}]
	>=dev-python/sympy-1.13[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
