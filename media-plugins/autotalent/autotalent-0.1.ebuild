# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="A real-time pitch correction plugin for LADSPA"
HOMEPAGE="http://web.mit.edu/tbaran/www/autotalent.html"
SRC_URI="http://web.mit.edu/tbaran/www/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

DEPEND="media-libs/ladspa-sdk"
RDEPEND="${DEPEND}"

src_compile() {
	emake || die
}

src_install() {
	dodoc README
	insinto /usr/$(get_libdir)/ladspa
	insopts -m0755
	doins *.so
}
