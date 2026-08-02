# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1

DESCRIPTION="Color palettes for Python"
HOMEPAGE="https://jiffyclub.github.io/palettable/"
SRC_URI="https://github.com/jiffyclub/palettable/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
"

RESTRICT="test"

src_prepare() {
	rm -r docs scripts test || true
	distutils-r1_src_prepare
}
