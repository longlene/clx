# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry-core
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python implementation of tree structures (Node, Tree, TreeData)"
HOMEPAGE="
	https://github.com/caesar0301/treelib
	https://pypi.org/project/treelib/
"
SRC_URI="https://github.com/caesar0301/treelib/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/six-1.13.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
