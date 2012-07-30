# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="A bash script which lets you backup your GNU/Linux installation."
HOMEPAGE="http://blinkeye.ch/mediawiki/index.php/GNU/Linux_System_Backup_Script_(stage4)"
SRC_URI="http://utenti.lycos.it/crys0000/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""

src_install() {
	dobin mkstage4.sh || die "dobin failed"
	dodoc ChangeLog README RESTORE || die "dodoc failed"
	prepall
}

pkg_postinst() {
	einfo
	einfo 'Type "mkstage4.sh" as root to run the script.'
	einfo
}