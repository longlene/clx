# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

DESCRIPTION="Stealth Chromium drop-in Playwright replacement with fingerprint patches"
HOMEPAGE="https://cloakbrowser.dev/ https://github.com/CloakHQ/CloakBrowser"
SRC_URI="https://github.com/CloakHQ/CloakBrowser/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/CloakBrowser-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="geoip patchright serve"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/playwright-1.40[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.24[${PYTHON_USEDEP}]
	geoip? (
		>=dev-python/geoip2-4.0[${PYTHON_USEDEP}]
		>=dev-python/socksio-1.0[${PYTHON_USEDEP}]
	)
	patchright? ( >=dev-python/patchright-1.40[${PYTHON_USEDEP}] )
	serve? (
		>=dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
		>=dev-python/websockets-12.0[${PYTHON_USEDEP}]
	)
')"
