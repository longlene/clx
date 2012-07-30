# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A cuddly teddy bear (or other image) for your composited X desktop"
HOMEPAGE="http://cteddy.mangobrain.co.uk/"
SRC_URI="http://cteddy.mangobrain.co.uk/downloads/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.10 x11-libs/libSM"
RDEPEND="${RDEPEND}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc AUTHORS README ChangeLog NEWS xteddy.credit xtuxxy.credit
}
