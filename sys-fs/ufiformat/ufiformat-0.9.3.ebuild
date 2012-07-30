# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/lsscsi/lsscsi-0.17.ebuild,v 1.7 2006/08/28 11:42:59 blubb Exp $

inherit toolchain-funcs

DESCRIPTION="USB Floppy Disk formatting tool"
HOMEPAGE="http://www.geocities.jp/tedi_world/format_usbfdd_e.html"
SRC_URI="http://www.geocities.jp/tedi_world/ufiformat-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~mips ~ppc ~sparc x86"
IUSE=""

DEPEND="sys-fs/e2fsprogs"

src_install() {
	exeinto /usr/bin
	doexe ufiformat
	dodoc AUTHORS ChangeLog NEWS README
}
