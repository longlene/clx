# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_PN="Rabbyt"

DESCRIPTION="Fast 2D sprite engine for Python using OpenGL"
HOMEPAGE="http://cheeseshop.python.org/pypi/Rabbyt/"
SRC_URI="http://cheeseshop.python.org/packages/source/R/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/python
	dev-python/setuptools
	dev-python/pyrex"
RDEPEND="virtual/python"

S="${WORKDIR}/${MY_PN}-${PV}"

DOCS="CHANGES"
