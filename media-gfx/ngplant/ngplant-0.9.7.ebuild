# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:/var/cvsroot/gentoo-amd64/media-gfx/ngplant/ngplant-0.9.7.ebuild,v 1.1 2009/02/23 17:10:09 th0th696 Exp $


SLOT="0"		
LICENSE="GPL-1"		
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~x86-fbsd"
DESCRIPTION="Program to build 3D plants"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
HOMEPAGE="http://ngplant.sourceforge.net/"
IUSE=""	

DEPEND="dev-util/scons
app-admin/eselect-wxwidgets
dev-perl/Alien-wxWidgets
media-libs/glew
virtual/glut"

src_compile() {
	scons || die "scons make failed, at this point you might try eselect
	wxwidgets list and then eselect wxwidgets set $something_from_that_list"
}

src_install() {
	#DESTDIR="${D}" scons install || die
	dodoc README 
}


