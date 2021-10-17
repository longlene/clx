# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="Jupyter/IPython Kernel Tools"
HOMEPAGE="https://github.com/Calysto/metakernel"
SRC_URI="https://github.com/Calysto/metakernel/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/ipykernel
	dev-python/pexpect
"
