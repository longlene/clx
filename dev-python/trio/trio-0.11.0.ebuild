# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_5 python3_6 )
inherit distutils-r1

DESCRIPTION="Trio – Pythonic async I/O for humans and snake people"
HOMEPAGE="https://github.com/python-trio/trio"
SRC_URI="https://github.com/python-trio/trio/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
