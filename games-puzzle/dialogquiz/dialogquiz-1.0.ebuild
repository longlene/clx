# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="A collection of trivia quizzes for Linux."
HOMEPAGE="http://linuxbox.co.uk/dialogquiz.php"
SRC_URI="http://linuxbox.co.uk/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="dev-lang/perl"

src_compile() {
	echo "nothing to compile"
}

src_install() {
	exeinto /usr/games/bin
	doexe dialogquiz	|| die "doexe failed"
	insinto /usr/share/games/${PN}
	doins questions/*	|| die "doins failed"
	prepgamesdir

	dodoc INSTALL README
}
