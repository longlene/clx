# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=(python{2_6,2_7,3_1,3_2,3_3} pypy{1_9,2_0})

inherit distutils-r1

DESCRIPTION="Pythonic argument parser, that will make you smile"
HOMEPAGE="http://pypi.python.org/pypi/docopt"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

python_install_all() {
	use examples && EXAMPLES=( examples/. )
	distutils-r1_python_install_all
}
