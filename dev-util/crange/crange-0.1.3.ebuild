# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="Crange is a tool to index and cross-reference C/C++ source code"
HOMEPAGE="https://github.com/crange/crange"
SRC_URI="https://github.com/crange/crange/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sys-devel/llvm[clang]
	dev-python/tabulate
"
