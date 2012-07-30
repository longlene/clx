# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Gdivelog is a SCUBA dive logging application for GNOME with an extendable plugin interface to allow data to be downloaded from various dive computers and imported from various other dive logging software."
HOMEPAGE="http://gdivelog.sourceforge.net/"
SRC_URI="mirror://sourceforge/gdivelog/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86"
IUSE=""
#IUSE="suunto"

DEPEND=""
#DEPEND="suunto? ( sys-apps/gdivelog-suunto-plugin )"
RDEPEND="gnome-base/libgnomeui
	dev-db/sqlite"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/$PN-0.5.1-1.patch"
}

src_compile() {
	econf || die "econf failed"
	#econf $(use_enable suunto enable-suunto-plugin) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
