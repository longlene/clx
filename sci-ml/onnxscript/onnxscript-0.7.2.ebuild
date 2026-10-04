# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="ONNX Script: Python scripting language for ONNX operators"
HOMEPAGE="
	https://github.com/microsoft/onnxscript
	https://microsoft.github.io/onnxscript/
"
SRC_URI="https://github.com/microsoft/onnxscript/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/ml-dtypes[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	>=sci-ml/onnx-ir-0.1.16[${PYTHON_USEDEP}]
	<sci-ml/onnx-ir-2[${PYTHON_USEDEP}]
	>=sci-ml/onnx-1.17[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.10[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
