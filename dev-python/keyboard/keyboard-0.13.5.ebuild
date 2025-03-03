# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_12 )

inherit distutils-r1 pypi

DESCRIPTION="Hook and simulate global keyboard events on Windows and Linux"
HOMEPAGE="
	https://pypi.org/project/keyboard/
	https://github.com/boppreh/keyboard
"
SRC_URI="https://github.com/boppreh/keyboard/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest
RESTRICT="test"
