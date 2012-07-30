# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="PyJoin is a program to join multiple MPEG files into one MPEG file."
HOMEPAGE="http://www.mynetcologne.de/~nc-mayha2"
SRC_URI="http://www.mynetcologne.de/~nc-mayha2/${PN}.py"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/python"

src_install() {
		into /usr
		newbin ${DISTDIR}/${PN}.py pyjoin
}
