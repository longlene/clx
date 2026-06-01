# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..15} )

inherit distutils-r1

DESCRIPTION="Attribute-access based filter for Python objects"
HOMEPAGE="https://github.com/aiogram/magic-filter https://pypi.org/project/magic-filter/"
SRC_URI="https://github.com/aiogram/magic-filter/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

EPYTEST_PLUGINS=()

distutils_enable_tests pytest
