# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_12 python3_13 python3_14  )

inherit distutils-r1 pypi

DESCRIPTION="Hyperspeed Python Web Framework"
HOMEPAGE="
	https://pypi.org/project/velocem/
"
SRC_URI="https://github.com/nickelpro/velocem/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

SLOT="0"
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
