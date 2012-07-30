# Copyright 1999-2009 Gentoo Foundation
# Copyroght 2009 Vladimir Rusinov <vladimir@greenmice.info>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Software for temporarily disabling ZeroCD and allowing the modem to be a modem."
HOMEPAGE="http://www.pharscape.org/ozerocdoff.html"
#SRC_URI="http://www.pharscape.org/forum/index.php?action=dlattach;topic=545.0;attach=4"
# Tarball provided as a forum attachment and it completely sucks. So, I had to
# copy it to my server.
SRC_URI="http://downloads.greenmice.info/distfiles/udev.tar.gz"

LICENSE="Uncknown"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/libusb sys-fs/udev"
RDEPEND="$DEPEND"

src_compile() {
	cd udev || die "Something wrong with the unpacked package"
	emake clean
	emake
}

src_install() {
	cd udev || die "Something wrong with the unpacked package"
	emake DESTDIR="${D}" install
	dodoc README
}

pkg_postinst() {
	ewarn "After installing this package all ZeroCDs would be rezeroed"
	einfo "automatically right after plugging"
	einfo 
	einfo "See README for more details"
	einfo
	ewarn "You might need to disable the option kernel module"
	einfo
	einfo "Run udevcontrol --reload_rules to reload udev rules"
}
