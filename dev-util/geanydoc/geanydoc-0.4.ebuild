# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Plugin for Geany IDE that execute specified commands for the word at the cursor"
HOMEPAGE="http://geany-plugins.sourceforge.net/geanydoc/"
SRC_URI="http://users.cosmostv.by/yurand/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-util/geany-0.16"

DEPEND="${RDEPEND}"

src_compile() {
	econf || die "econf failed."
	emake || die "emake failed."
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
}

