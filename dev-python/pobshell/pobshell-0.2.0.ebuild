# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A Bash-like shell for live Python objects"
HOMEPAGE="
	https://pypi.org/project/pobshell/
	https://github.com/pdalloz/pobshell
"
SRC_URI="https://github.com/pdalloz/pobshell/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/cmd2-2.5.8[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.15.1[${PYTHON_USEDEP}]
	>=dev-python/pympler-0.9[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.16.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
