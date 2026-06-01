# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="WeChat SDK for Python"
HOMEPAGE="
	https://pypi.org/project/wechatpy/
	https://github.com/wechatpy/wechatpy/
"
SRC_URI="https://github.com/wechatpy/wechatpy/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/six-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4.3[${PYTHON_USEDEP}]
	>=dev-python/xmltodict-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/optionaldict-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.5.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
