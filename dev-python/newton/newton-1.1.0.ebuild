# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A GPU-accelerated physics engine for robotics simulation"
HOMEPAGE="
	https://pypi.org/project/newton/
	https://github.com/newton-physics/newton
"
SRC_URI="https://github.com/newton-physics/newton/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>dev-python/warp-lang-1.13.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
