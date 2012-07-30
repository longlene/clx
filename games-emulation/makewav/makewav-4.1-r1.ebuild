# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games

DESCRIPTION="The Cuttle Cart and Supercharger development program!"
HOMEPAGE="http://members.cox.net/rcolbert/makewav.htm"
SRC_URI="http://members.cox.net/rcolbert/zip/makewav4.1.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 ppc sparc"
IUSE=""

DEPEND=""

src_compile(){
	emake || die "emake failed"

}

src_install() {
	egamesinstall || die
}