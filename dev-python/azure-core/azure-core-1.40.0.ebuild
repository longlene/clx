# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Microsoft Azure Core Library for Python"
HOMEPAGE="
	https://pypi.org/project/azure-core
	https://github.com/Azure/azure-sdk-for-python/
"
SRC_URI="https://github.com/Azure/azure-sdk-for-python/archive/refs/tags/${PN}_${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/azure-sdk-for-python-${PN}_${PV}/sdk/core/${PN}/
