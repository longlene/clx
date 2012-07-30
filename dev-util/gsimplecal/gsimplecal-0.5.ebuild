# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit autotools

DESCRIPTION="A lightweight calendar designed for tint2"
HOMEPAGE="http://code.google.com/p/gsimplecal/"
SRC_URI="http://gsimplecal.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/gtk+:2"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	>=sys-devel/autoconf-2.65"

S=$WORKDIR/$PF

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc README NEWS AUTHORS ChangeLog
}
