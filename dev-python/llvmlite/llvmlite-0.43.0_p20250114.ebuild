# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 llvm

EGIT_COMMIT="d1a62a6d4e8ab8d70e39705af9c921a9540ea1b4"

DESCRIPTION="A lightweight LLVM python binding for writing JIT compilers"
HOMEPAGE="https://llvmlite.readthedocs.io/en/latest/ https://pypi.org/project/llvmlite/"
SRC_URI="https://github.com/numba/llvmlite/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="llvm-core/llvm:15"
RDEPEND="${BDEPEND}"
DEPEND="${RDEPEND}"

distutils_enable_tests pytest

LLVM_MAX_SLOT="15"

S="${WORKDIR}"/llvmlite-${EGIT_COMMIT}
