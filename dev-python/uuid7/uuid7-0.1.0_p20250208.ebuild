# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="d6759759245b6e9eb1d9eeb722984b3ceb4bf637"

DESCRIPTION="time-sortable UUIDs"
HOMEPAGE="
	https://pypi.org/project/uuid7/
	https://github.com/stevesimmons/uuid7
"
SRC_URI="https://github.com/stevesimmons/uuid7/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
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

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
