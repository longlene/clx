# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="OS-independent wrapper for shlex and mslex"
HOMEPAGE="
	https://pypi.org/project/oslex/
	https://github.com/petamas/oslex
"
SRC_URI="https://github.com/petamas/oslex/archive/refs/tags/release/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/mslex[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/oslex-release-v${PV}
