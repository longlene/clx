# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="PDS plug-in for loading NASA/ESA PDS/EDR format images"
SRC_URI="http://mars-news.de/gimp/gimp-2.4/pds-${PV}.tar.gz"
HOMEPAGE="http://mars-news.de/gimp/"

SLOT="0"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND=">=media-gfx/gimp-2.4"

S="${WORKDIR}/pds-${PV}"

src_compile() {
	econf || die
	emake || die
}

src_install() {
	make DESTDIR="${D}" install || die

	dodoc AUTHORS ChangeLog NEWS README
}
