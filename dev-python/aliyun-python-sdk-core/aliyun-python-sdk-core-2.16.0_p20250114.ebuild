# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="ed99c6811d07001712d1d2d51296cfd532fa72a9"

MY_PN="aliyun-openapi-python-sdk"

DESCRIPTION="The core module of Aliyun Python SDK"
HOMEPAGE="
	https://pypi.org/project/aliyun-python-sdk-core/
"
SRC_URI="https://github.com/aliyun/aliyun-openapi-python-sdk/archive/${EGIT_COMMIT}.tar.gz -> ${MY_PN}-${EGIT_COMMIT}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/jmespath-0.9.3[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3.0.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${MY_PN}-${EGIT_COMMIT}/${PN}
