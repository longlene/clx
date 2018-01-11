# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="Python library for creating data pipelines with chain functional programming"
HOMEPAGE="http://www.pyfunctional.org"
SRC_URI="https://github.com/EntilZha/PyFunctional/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/future
	dev-python/six
	dev-python/dill
	dev-python/bz2file
	dev-python/tabulate
"
