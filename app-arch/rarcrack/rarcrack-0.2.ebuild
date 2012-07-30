# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PV="rarcrack-${PV}"

DESCRIPTION="Password recovery for 7zip, rar and zip files"
HOMEPAGE="http://rarcrack.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="7zip rar zip"

DEPEND=">=sys-libs/glibc-2.4"
RDEPEND="${RDEPEND}
	rar?  ( app-arch/unrar )
	zip?  ( app-arch/unzip )
	7zip? ( app-arch/p7zip )
"

src_install() {
	dobin ${PN}
}

pkg_postinst() {
	elog "Rarcrack requires the helper applications to extract"
	elog "the archives.  It was designed to work with"
	elog "7zip, rar and zip filetypes.  Activate the USE flags"
	elog "or install pz7ip, unrar or unzip seperately depending"
	elog "on your needs."
}

