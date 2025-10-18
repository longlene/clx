# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Python Webpush Data encryption library"
HOMEPAGE="
	https://pypi.org/project/pywebpush/
	https://github.com/web-push-libs/pywebpush
"
SRC_URI="https://github.com/web-push-libs/pywebpush/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.6.1[${PYTHON_USEDEP}]
	>=dev-python/http-ece-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
	>=dev-python/six-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/py-vapid-1.7.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
