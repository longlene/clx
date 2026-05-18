# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A Wadler–Lindig pretty printer for Python"
HOMEPAGE="
	https://pypi.org/project/wadler-lindig/
	https://github.com/patrick-kidger/wadler_lindig
"
SRC_URI="https://github.com/patrick-kidger/wadler_lindig/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/wadler_lindig-${PV}
