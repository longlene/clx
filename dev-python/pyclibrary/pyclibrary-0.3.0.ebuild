# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="C parser and ctypes automation for python"
HOMEPAGE="
	https://pypi.org/project/pyclibrary/
	https://github.com/MatthieuDartiailh/pyclibrary
"
SRC_URI="https://github.com/MatthieuDartiailh/pyclibrary/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyparsing-2.3.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PYCLIBRARY="${PV}"
