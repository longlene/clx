# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Real-time server-rendered interfaces for Django using WebSockets"
HOMEPAGE="
	https://pypi.org/project/django-liveview/
	https://github.com/Django-LiveView/liveview
"
SRC_URI="https://github.com/Django-LiveView/liveview/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/liveview-${PV}
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/django-4.2[${PYTHON_USEDEP}]
	>=dev-python/channels-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/channels-redis-4.0.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
