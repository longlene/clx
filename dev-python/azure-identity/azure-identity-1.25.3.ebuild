# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Microsoft Azure Identity Library for Python"
HOMEPAGE="
	https://pypi.org/project/azure-identity
	https://github.com/Azure/azure-sdk-for-python/
"
SRC_URI="https://github.com/Azure/azure-sdk-for-python/archive/refs/tags/${PN}_${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/azure-sdk-for-python-${PN}_${PV}/sdk/identity/${PN}/
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/azure-core-1.31.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.5[${PYTHON_USEDEP}]
	>=dev-python/msal-1.35.1[${PYTHON_USEDEP}]
	>=dev-python/msal-extensions-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
