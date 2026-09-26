# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Open source ERP system built on the Frappe framework"
HOMEPAGE="
	https://erpnext.com/
	https://github.com/frappe/erpnext
"
SRC_URI="https://github.com/frappe/erpnext/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
# tests need a configured frappe site with MariaDB/Redis
RESTRICT="test"

RDEPEND="
	>=dev-python/frappe-16.21.0[${PYTHON_USEDEP}]
	<dev-python/frappe-17[${PYTHON_USEDEP}]
	>=dev-python/barcodenumber-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/googlemaps-4.10.0[${PYTHON_USEDEP}]
	>=dev-python/holidays-0.87[${PYTHON_USEDEP}]
	>=dev-python/mt940-4.26.0[${PYTHON_USEDEP}]
	>=dev-python/pdfplumber-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/plaid-python-7.2.1[${PYTHON_USEDEP}]
	>=dev-python/pypng-0.20220715.0[${PYTHON_USEDEP}]
	>=dev-python/python-youtube-0.9.9[${PYTHON_USEDEP}]
	>=dev-python/rapidfuzz-3.14.3[${PYTHON_USEDEP}]
	>=dev-python/unidecode-1.4.0[${PYTHON_USEDEP}]
"
