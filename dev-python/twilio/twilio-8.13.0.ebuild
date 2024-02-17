# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="Twilio API client and TwiML generator"
HOMEPAGE="https://github.com/twilio/twilio-python"
SRC_URI="https://github.com/twilio/twilio-python/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-retry-2.0.3[${PYTHON_USEDEP}]
"
BDEPEND=""

#distutils_enable_tests pytest
