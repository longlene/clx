# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="YouGrabber is a lightweight, multi-threaded (NPTL based) command line"
HOMEPAGE="http://yougrabber.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/YouGrabber-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
S=${WORKDIR}/YouGrabber-${PV}
KEYWORDS="x86"

DEPEND=">=net-misc/curl-7.15.4
	>=sys-libs/ncurses-5.5"
RDEPEND="${DEPEND}"

QA_EXECSTACK="usr/bin/yg"

src_unpack() {
	unpack ${A} || die "Failed to unpack ${A}"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dobin yg || die "dobin yg failed"
	dodoc README CHANGELOG
}
