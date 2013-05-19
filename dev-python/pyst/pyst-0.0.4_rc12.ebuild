# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

MY_P=${PN}'-'`delete_version_separator '_'`

DESCRIPTION="Asterisk related utility modules for the Python programming
language"
HOMEPAGE="http://sourceforge.net/projects/pyst/"
SRC_URI="mirror://sourceforge/pyst/${MY_P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND=""

S=${WORKDIR}/${MY_P}

src_compile() {
	cd ${S}
	python setup.py build || die
}

src_install() {
	cd ${D}/${MY_P}
	python setup.py install --root=${D} --prefix=/usr || die
	dodoc PKG-INFO Manifest.in
}	
