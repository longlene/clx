# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..14}  )

inherit distutils-r1 pypi

DESCRIPTION="Create sentinel and singleton objects in Python"
HOMEPAGE="
	https://pypi.org/project/sentinel/
	https://github.com/eddieantonio/sentinel
"
SRC_URI="https://github.com/eddieantonio/sentinel/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
