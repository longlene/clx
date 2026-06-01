# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Python base classes for rich path objects"
HOMEPAGE="
	https://pypi.org/project/pathlib-abc/
	https://github.com/barneygale/pathlib-abc
"
SRC_URI="https://github.com/barneygale/pathlib-abc/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="PYTHON"
SLOT="0"
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
