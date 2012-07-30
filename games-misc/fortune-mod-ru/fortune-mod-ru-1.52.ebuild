# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-misc/fortune-mod-smac/fortune-mod-smac-0.1.ebuild,v 1.13 2006/07/19 19:59:03 flameeyes Exp $

DESCRIPTION="Russian fortunes"
HOMEPAGE="http://jack.kiev.ua/content/view/8/9/lang,ru/"
SRC_URI="http://jack.kiev.ua/filez/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND="games-misc/fortune-mod"

src_unpack() {
	unpack ${A}
	cd ${S}
	sed -i 's/share\/games\/fortunes/share\/fortune/g' Makefile
}

src_install() {
	insinto /usr/share/fortune
	echo ${D}
	make install DESTDIR=${D} || die
}
