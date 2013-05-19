# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON=2.4

inherit eutils distutils python

DESCRIPTION="Backport of the multiprocessing package to Python 2.4 and 2.5"
HOMEPAGE="http://code.google.com/p/python-multiprocessing"
SRC_URI="http://pypi.python.org/packages/source/m/${PN}/${P}.tar.gz"

LICENSE="BSD Licence"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


DEPEND=""
RDEPEND=""

pkg_setup(){
	python_version

	if [[ ${PYVER} == "2.6" ]]
	then
	  die """
	  Python 2.6 and newer versions already come with multiprocessing.
	  Although the stand alone variant of the multiprocessing package
	  is kept compatible  with 2.6, you mustn't install it with Python 2.6.
	  """
	fi
}

src_unpack(){
	unpack ${A}
}


src_install(){
	distutils_src_install
}
