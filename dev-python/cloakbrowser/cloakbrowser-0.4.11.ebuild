# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Stealth Chromium drop-in Playwright replacement with fingerprint patches"
HOMEPAGE="https://cloakbrowser.dev/ https://github.com/CloakHQ/CloakBrowser"
SRC_URI="https://github.com/CloakHQ/CloakBrowser/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/CloakBrowser-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="geoip serve"
RESTRICT="test"

RDEPEND="
	>=dev-python/cryptography-41.0[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	>=dev-python/playwright-bin-1.40[${PYTHON_USEDEP}]
	geoip? (
		>=dev-python/geoip2-4.0[${PYTHON_USEDEP}]
		>=dev-python/socksio-1.0[${PYTHON_USEDEP}]
	)
	serve? (
		>=dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
		>=dev-python/websockets-12.0[${PYTHON_USEDEP}]
	)
"
