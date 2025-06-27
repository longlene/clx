# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )
inherit distutils-r1

DESCRIPTION="Abseil Python Common Libraries"
HOMEPAGE="
	https://pypi.org/project/absl-py/
	https://github.com/abseil/abseil-py
"
SRC_URI="https://github.com/abseil/abseil-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""

distutils_enable_tests pytest
