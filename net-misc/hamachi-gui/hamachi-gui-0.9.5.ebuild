# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Hamachi-GUI is a free, fuctional GTK-interface for hamachi"
HOMEPAGE="http://hamachi-gui.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/${PN}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-misc/hamachi
	x11-libs/gtk+"
RDEPEND="${DEPEND}"

src_compile() {
	econf
	emake || die "emake failed"
}

src_install() {
emake DESTDIR="${D}" install
}
