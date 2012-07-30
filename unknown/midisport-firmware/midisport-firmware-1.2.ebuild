# midisport-firmware ebuild, version 0.9 beta
# Copyright 2008 nixscripter@gmail.com
# Distributed under the terms of the GNU General Public License v2
# (Perfectly willing to hand copyright over to the Gentoo Foundation, should
# they take interest).

# NOTES:
# Should be placed, in my opinion, under media-sound/midisport-firmware, but I
# suppose that since it's technically a hardware driver, could be put somewhere
# else as well.
#
# Also, this assumes that everyone will have their udev directory in /etc/udev.
# If this is not the case, then somehow this information needs to be passed to
# the configure script with the option --with-udev=$WHEREVER in order for the
# installation of the udev rules to work properly.

inherit eutils

DESCRIPTION="A package to install firmware for M-Audio/Midiman USB MIDI devices"
HOMEPAGE="http://usb-midi-fw.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/usb-midi-fw/midisport-firmware-1.2.tar.gz" # somewhat annoying due to lots of redirects, but it's where to get the tarball for now


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="sys-apps/fxload >=sys-fs/udev-115"
DEPEND="${RDEPEND}"

src_compile() {
	econf || die "Configure script failed"
	emake || die "Make failed"
}

src_install() {
	emake install DESTDIR="${D}" || die "Install failed"
}

