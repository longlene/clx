# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="MicroPie is an ultra-micro ASGI Python web framework that gets out of your way"
HOMEPAGE="
	https://pypi.org/project/micropie/
	https://github.com/patx/micropie
"
SRC_URI="https://github.com/patx/micropie/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
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
