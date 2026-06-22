# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python function for condensing JSON using replacement strings"
HOMEPAGE="
	https://pypi.org/project/condense-json/
	https://github.com/simonw/condense-json
"
SRC_URI="https://github.com/simonw/condense-json/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

#S="${WORKDIR}"/${P}
