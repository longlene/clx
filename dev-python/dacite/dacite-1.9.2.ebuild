# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="This module simplifies creation of data classes (PEP 557) from dictionaries"
HOMEPAGE="https://github.com/konradhalas/dacite"
SRC_URI="https://github.com/konradhalas/dacite/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

EPYTEST_IGNORE=(
	# benchmarks
	tests/performance
)

distutils_enable_tests pytest

python_test() {
	epytest -o "addopts="
}
