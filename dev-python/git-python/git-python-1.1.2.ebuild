# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="combination and simplification of some useful git commands"
HOMEPAGE="
	https://github.com/pynickle/git-python
	https://pypi.org/project/git-python/
"
SRC_URI="https://github.com/pynickle/git-python/archive/refs/tags/v1.1.2.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/gitpython[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"
