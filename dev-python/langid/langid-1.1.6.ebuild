# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_11 )

inherit distutils-r1 pypi

DESCRIPTION="Standalone Language Identification (LangID) tool"
HOMEPAGE="
	https://pypi.org/project/langid/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""

RESTRICT="test"
