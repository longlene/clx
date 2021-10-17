# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="A Jupyter radare2 kernel"
HOMEPAGE="https://github.com/guedou/jupyter_radare2"
SRC_URI="https://github.com/guedou/jupyter-radare2/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/jupyter
	dev-python/r2pipe
"
