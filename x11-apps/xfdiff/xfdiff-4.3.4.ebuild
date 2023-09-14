# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Xfdiff is graphic interface to the GNU diff and patch commands."
HOMEPAGE="http://xffm.sf.net/xfdiff.html"
SRC_URI="mirror://sourceforge/${PN/diff/fm}/${P}.tar.gz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="~x86"
IUSE="libxfcegui4"

DEPEND="x11-libs/libtubo
		libxfcegui4? ( xfce-base/libxfcegui4 )"

src_compile() {
	econf \
	$(use_enable libxfcegui4) || die "econf failed."
}

src_install() {
	make DESTDIR=${D} install || die "make failed."
}
