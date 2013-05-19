# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_PN=Spawning
MY_P=${MY_PN}-${PV}
DESCRIPTION="A flexible web server written in Python"
HOMEPAGE="http://pypi.python.org/pypi/Spawning"
SRC_URI="http://pypi.python.org/packages/source/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-lang/python
	dev-python/eventlet
	dev-python/pastedeploy
	dev-python/simplejson"

S=${WORKDIR}/${MY_P}
