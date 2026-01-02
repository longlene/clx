# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )
inherit distutils-r1

DESCRIPTION="Writing Code That Works Natively with PyTorch, TensorFlow, JAX, and NumPy"
HOMEPAGE="https://github.com/jonasrauber/eagerpy"
SRC_URI="https://github.com/jonasrauber/eagerpy/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/numpy
	>=dev-python/typing-extensions-3.7.4.1
"
RDEPEND="${DEPEND}"
BDEPEND=""
