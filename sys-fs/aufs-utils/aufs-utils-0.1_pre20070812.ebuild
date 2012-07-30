# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Userspace utilities for aufs."
HOMEPAGE="http://aufs.sourceforge.net/"
SRC_URI="http://www.rit.edu/~reh5586/gentoo/distfiles/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S=${WORKDIR}/aufs

src_compile() {
	emake -j1 -f local.mk aufs.5 mount.aufs auplink aulchown umount.aufs \
	|| die "emake failed"
}

src_install() {
	exeinto /sbin
	exeopts -m0500
	doexe mount.aufs umount.aufs auplink aulchown
	doman aufs.5
}
