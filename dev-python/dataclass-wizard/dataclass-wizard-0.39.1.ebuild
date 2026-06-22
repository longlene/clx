# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Simple, elegant, wizarding tools for interacting with Python's dataclasses"
HOMEPAGE="
	https://pypi.org/project/dataclass-wizard/
	https://dcw.ritviknag.com/
	https://github.com/rnag/dataclass-wizard
"
SRC_URI="https://github.com/rnag/dataclass-wizard/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
