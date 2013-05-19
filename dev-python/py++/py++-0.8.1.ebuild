# Copyright 2005 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit distutils

DESCRIPTION="Py++"
HOMEPAGE="http://sf.net/projects/pygccxml/"

MY_PN=Py++
MY_P="${MY_PN}-${PV}"

SRC_URI="mirror://sourceforge/pygccxml/${MY_P}.zip"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="dev-lang/python
        dev-python/pygccxml"

S=${WORKDIR}/${MY_P}

