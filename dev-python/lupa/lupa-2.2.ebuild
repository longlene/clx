# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1 vcs-snapshot

DESCRIPTION="Lua in Python"
HOMEPAGE="https://github.com/scoder/lupa"
SRC_URI="https://github.com/scoder/lupa/archive/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/cython
"
