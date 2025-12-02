# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="0d9e212526276889ece2e0645b625480551a1ccc"

DESCRIPTION="Pure CDP but type-safe in Python"
HOMEPAGE="
	https://pypi.org/project/cdp-use/
	https://github.com/browser-use/cdp-use
"
SRC_URI="https://github.com/browser-use/cdp-use/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/websockets-15.0.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
