# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="${PV//./}"
MY_P=${PN}-${MY_PV}

DESCRIPTION="Extensive database of location and timezone data for nearly every airport"
HOMEPAGE="
	https://pypi.org/project/airportsdata/
	https://github.com/mborsetti/airportsdata/
"
SRC_URI="https://github.com/mborsetti/airportsdata/archive/refs/tags/v$MY_PV.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/${MY_P}
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
