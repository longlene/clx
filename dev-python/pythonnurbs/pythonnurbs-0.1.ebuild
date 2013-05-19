# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_PN="PythonNURBS"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python language bindings for the NURBS++ library"
HOMEPAGE="http://pypi.python.org/pypi/${MY_PN}/"
SRC_URI="http://pypi.python.org/packages/source/P/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

S="${WORKDIR}/${MY_P}"
