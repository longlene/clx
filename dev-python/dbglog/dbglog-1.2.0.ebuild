# Copyright (C) 2008  Seznam.cz, a.s.
# Distributed under the terms of the LGPL License
# $Header$

NEED_PYTHON="2.4"

inherit distutils

DESCRIPTION="C++ library for debugging purposes and runtime logging to file - python extension"
HOMEPAGE="http://dbglog.sourceforge.net/"
SRC_URI="http://switch.dl.sourceforge.net/sourceforge/dbglog/python2.4-${P}.tar.bz2"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/setuptools ( >=dev-libs/libdbglog-1.5.0 )"
RDEPEND="${DEPEND}"
S="${WORKDIR}/python2.4-${P}"
