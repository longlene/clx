# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2


MOD_DESC="Zombie-themed singleplayer TC"
MOD_NAME="Out Of Hell"
MOD_DIR="Out_Of_Hell"

inherit games games-mods

HOMEPAGE="http://outofhell.net/"
SRC_URI="Out_Of_Hell_2009_Release.rar 2009-11-20-out_of_hell_patch_v1.rar"
DEPEND="|| ( app-arch/unrar app-arch/rar )"
RESTRICT="fetch"

LICENSE="freedist"
KEYWORDS="~amd64 ~x86"
IUSE="dedicated opengl"

src_unpack() {
	unpack Out_Of_Hell_2009_Release.rar
	unpack 2009-11-20-out_of_hell_patch_v1.rar
	cp -R "OUT OF HELL PATCH/${MOD_DIR}" ./
}

src_prepare(){
	rm *.lnk
	rm ${MOD_DIR}/System/*.lnk
	rm ${MOD_DIR}/Help/Thumbs.db
	rm -rf "OUT OF HELL PATCH"
}

pkg_nofetch() {
	elog "Please download 'Out Of Hell 2009 Release.rar'"
	elog "from http://outofhell.freeforums.org/out-of-hell-download-links-updated-nov-2-09-t44.html"
	elog 
	elog "Then put the file in ${DISTDIR} as Out_Of_Hell_2009_Release.rar"
	elog
	elog "Also download 2009-11-20-out_of_hell_patch_v1.rar from "
	elog "http://outofhell.freeforums.org/out-of-hell-patch-v1-released-links-t121.html"
	elog "Then put the file in ${DISTDIR}"
}
