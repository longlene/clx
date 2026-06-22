# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Simple python library for color and formatting to terminal"
HOMEPAGE="
	https://pypi.org/project/colored/
	https://gitlab.com/dslackw/colored
"
SRC_URI="https://gitlab.com/dslackw/colored/-/archive/${PV}/colored-${PV}.tar.gz -> ${P}.gl.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
