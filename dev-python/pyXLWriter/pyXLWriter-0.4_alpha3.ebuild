# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

MY_P=${P/_alpha/a}
S=${WORKDIR}/${MY_P}

DESCRIPTION="A set of python classes that make it possible to produce excel
workbooks from python programs."
SRC_URI="mirror://sourceforge/pyxlwriter/${MY_P}.zip"
HOMEPAGE="http://pyxlwriter.sourceforge.net"

KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="LGPL-2"
IUSE=""

DEPEND=">=dev-lang/python-2.3"

DOCS="*.txt examples"
