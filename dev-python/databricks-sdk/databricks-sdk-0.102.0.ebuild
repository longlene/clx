# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PN="${PN}-py"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Databricks SDK for Python"
HOMEPAGE="
	https://pypi.org/project/databricks-sdk/
	https://github.com/databricks/databricks-sdk-py
"
SRC_URI="https://github.com/databricks/databricks-sdk-py/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/${MY_P}
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/requests-2.28.1[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.25.8[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
