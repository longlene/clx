# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Redis channel layer backend for Django Channels"
HOMEPAGE="
	https://pypi.org/project/channels-redis/
	https://github.com/django/channels_redis
"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/redis-4.6.0[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/asgiref-3.9.1[${PYTHON_USEDEP}]
	>=dev-python/channels-4.2.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/async-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
