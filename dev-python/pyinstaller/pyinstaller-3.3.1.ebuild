# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="Freeze (package) Python programs into stand-alone executables"
HOMEPAGE="http://www.pyinstaller.org"
SRC_URI="https://github.com/pyinstaller/pyinstaller/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/setuptools
	dev-python/pefile
	dev-python/macholib
	dev-python/altgraph
"
