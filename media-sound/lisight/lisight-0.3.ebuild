# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils linux-mod

DESCRIPTION="Linux ALSA driver for the ieee1394 Apple iSight audio unit"
HOMEPAGE="http://lisight.sourceforge.net/"
SRC_URI="http://lisight.sourceforge.net/${P}.tar.bz2"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="udev"

MODULE_NAMES="lisight(extra:${S}:${S})"
BUILD_TARGETS="default"
CONFIG_CHECK="EXPERIMENTAL KMOD IEEE1394 IEEE1394_OHCI1394 SND SND_PCM_OSS"

src_unpack() {
	unpack ${A}
	cd ${S}

	# force makefile to use the kernel on the /usr/sec/linux link
	sed -i -e 's/^\(CURRENT = \).*/\1'${KV_FULL}'/' Makefile

	# stop makefile from running shell scripts
	sed -i -e 's/sh .\/p.*_install.sh//g' Makefile
}

src_install() {
	linux-mod_src_install || die "failed to install module"

	dodoc AUTHORS ChangeLog README INSTALL TODO lisight-kernel.patch

	if use udev; then
		dodir /etc/udev/rules.d/
		echo 'KERNEL=="liSight*", NAME=="liSight-%n", GROUP="audio"' \
			> "${D}/etc/udev/rules.d/77-lisight.rules"
	fi
}

pkg_postinst() {
	ewarn "******************************************************************"
	ewarn "* Ensure that you have patched the the kernel's ieee1394 drivers *"
	ewarn "* and rebuilt them.  Please read the documentation.              *"
	ewarn "******************************************************************"
}
