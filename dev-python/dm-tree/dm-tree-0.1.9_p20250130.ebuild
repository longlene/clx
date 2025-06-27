# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

EGIT_COMMIT="3e79613493826e1eab59cfcfa2e4a54b56900c77"

DESCRIPTION="Tree is a library for working with nested data structures"
HOMEPAGE="
	https://pypi.org/project/dm-tree/
	https://github.com/google-deepmind/tree
"
SRC_URI="https://github.com/google-deepmind/tree/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/abseil-py-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/attrs-18.2.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.11.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/tree-${EGIT_COMMIT}

PATCHES=(
	"${FILESDIR}"/system-dep.patch
)
