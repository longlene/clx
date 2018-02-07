# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="Mesa is a agent-based modeling framework in Python"
HOMEPAGE="https://github.com/projectmesa/mesa"
SRC_URI="https://github.com/projectmesa/mesa/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/setuptools
	dev-python/numpy
	dev-python/pandas
	dev-python/jupyter
"
