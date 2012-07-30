# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /home/segin/coredumper-0.2.ebuild,v 0.1 2005/12/14 01:33:13 segin Exp $

IUSE=""

DESCRIPTION="Zinc is a curses-based Yahoo! chat client written in Python"
HOMEPAGE="http://www.larvalstage.com/zinc/"
SRC_URI="http://www.larvalstage.com/zinc/files/zinc-1.1rc3.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"

DEPEND=">=dev-lang/python-2.1
        >=sys-libs/ncurses-5.2"
		
src_unpack() {
	unpack ${A} || die
}

src_compile() {
	touch .
}

src_install () {
	cd "${WORKDIR}/zinc-1.1rc3"
	mkdir "${D}/usr" "${D}/usr/lib"
	sh install.sh "--prefix=${D}/usr"
}
			
