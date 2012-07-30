# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/zfs-fuse/zfs-fuse-0.6.9-r1.ebuild,v 1.2 2010/06/23 08:56:57 ssuominen Exp $

EAPI="2"
inherit eutils multilib

DESCRIPTION="Desktop event notifier for Android devices"
HOMEPAGE="http://code.google.com/p/android-notifier/"
SRC_URI="amd64?  ( http://android-notifier.googlecode.com/files/${PN}-${PV}-linux-amd64.zip )
         x86? ( http://android-notifier.googlecode.com/files/${PN}-${PV}-linux-i386.zip )"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	insinto /usr/share/${PN}
	doins -r ${WORKDIR}/${PN}/* || die

	make_wrapper android-notifier ./run.sh ${PN}

	doicon ${PN}/icons/${PN}.png || die "doicon failed"

	make_desktop_entry android-notifier "AndroidNotifier" \
	/usr/share/pixmaps/${PN}-desktop.png "Utility" || die "make_desktop_entry failed"
}

