# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="A Python wrapper for the tesseract-ocr API"
HOMEPAGE="https://github.com/sirfz/tesserocr"
SRC_URI="https://github.com/sirfz/tesserocr/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	app-text/tesseract
	>=dev-python/cython-0.23[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
