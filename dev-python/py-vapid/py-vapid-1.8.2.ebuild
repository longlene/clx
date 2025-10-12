# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Simple VAPID header generation library"
HOMEPAGE="
	https://pypi.org/project/py-vapid/
	https://github.com/web-push-libs/vapid/
"
SRC_URI="https://github.com/web-push-libs/vapid/archive/refs/tags/${PV}.tar.gz -> vapid-${PV}.gh.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/cryptography-2.5[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/vapid-${PV}/python
