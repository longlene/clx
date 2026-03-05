# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Python wrapper around sox"
HOMEPAGE="
	https://pypi.org/project/sox/
	https://github.com/marl/pysox
"
SRC_URI="https://github.com/marl/pysox/archive/refs/tags/v${PV}.tar.gz -> pysox-${PV}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	media-sound/sox
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/pysox-${PV}
