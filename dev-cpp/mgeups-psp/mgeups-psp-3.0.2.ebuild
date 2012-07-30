# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="MGE UPS SYSTEMS Personal Solution Pac"
HOMEPAGE="http://www.mgeups.com/products/pdt230/software/sp97/solpaclinux.htm"
SRC_URI="http://opensource.mgeups.com/projects/mgeups-psp/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=">=sys-power/nut-2.0.2"

DEPEND="${RDEPEND} 
>=dev-cpp/glibmm-2.4.4
>=dev-cpp/gtkmm-2.4.5
>=x11-libs/pango-1.4.1
>=dev-libs/libsigc++-2.0.3
dev-libs/libusb
dev-util/desktop-file-utils"


src_compile() {
	econf configure || die "could not configure"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "install failed"
	into /etc
	dosym /etc/nut/ /etc/ups
}

pkg_postinst() {
	#add the ups group to the system
	enewgroup ups
	# this is to ensure that everybody that installed old versions still has
	# correct permissions
	chown root:ups ${ROOT}/etc/nut/{ups.conf,upsd.conf,upsd.users,upsmon.conf,upssched.conf,wizard.conf} 2>/dev/null
	
	
	ewarn "You need to add the nut user to the ups and uucp group with the command 
	gpasswd -a nut ups. Don't forget to add the nut user to the tty group."
	
	einfo "Then you have to start the nut'drivers with these commands: upsdrvctl start, 
	upsd and upsmon. To start them automitacally on boot time, add them to /etc/conf.d/local.start.
	The first time you launch Personal Solution Pac, do it from a terminal 
	with the command : psp & (root access required).The next time, you can start it
	by adding the command on your .xinitrc or window manager startup script (by example ~/.kde/Autostart/)."
}

