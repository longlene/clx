# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""

NECDOC="http://www.si-list.org/NEC_Archives/"

RESTRICT=""
DESCRIPTION="nec2doc is the original user documentation for all the packages based on the free nec2 antenna modelisation software."
HOMEPAGE="http://www.si-list.org/swindex2.html"
SRC_URI="${NECDOC}nec2prt1.pdf
	${NECDOC}nec2prt2.pdf
	${NECDOC}nec2prt3.pdf"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND=""

src_install() {
	insinto /usr/share/doc/${PF}
	doins ${DISTDIR}/nec2prt*.pdf
}
