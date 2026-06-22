# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Microsoft Authentication Extensions for Python"
HOMEPAGE="
	https://pypi.org/project/msal-extensions/
	https://github.com/AzureAD/microsoft-authentication-extensions-for-python
"
SRC_URI="https://github.com/AzureAD/microsoft-authentication-extensions-for-python/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/microsoft-authentication-extensions-for-python-${PV}
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/msal-1.29.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
