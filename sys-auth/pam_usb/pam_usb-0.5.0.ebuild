# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-auth/pam_usb/pam_usb-0.3.2.ebuild,v 1.3 2005/09/16 11:16:21 agriffis Exp $

inherit eutils pam

DESCRIPTION="A PAM module that enables authentication using an USB-Storage device (such as an USB Pen) through DSA private/public keys."
SRC_URI="http://sourceforge.net/projects/pamusb/files/pam_usb/${P}/${P}.tar.gz"
HOMEPAGE="http://www.pamusb.org/"

IUSE=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="
	dev-libs/libxml2
	sys-fs/udisks
 	sys-apps/dbus
	sys-libs/pam
	sys-apps/pmount
	dev-python/celementtree
	dev-python/dbus-python
	dev-python/pygobject"

RDEPEND="${DEPEND}"

src_compile() {
	emake || die "make failed"
}

src_install() {
	# The Makefile expects these to exist
	dodir $(getpam_mod_dir) /usr/bin /usr/share/man/man1

	einstall DESTDIR=${D} PAM_MODULES="${D}/$(getpam_mod_dir)" \
		DOCS_DEST="${D}usr/share/doc/${PF}/" || die "einstall failed"
	dodoc ChangeLog
}
