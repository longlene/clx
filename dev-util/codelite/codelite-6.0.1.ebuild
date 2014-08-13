# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

WX_GTK_VER="2.9"

inherit base eutils wxwidgets

DESCRIPTION="Cross platform IDE for the C/C++ programming languages"
HOMEPAGE="http://www.codelite.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}-gtk.src.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="debug mysql pch postgres"

DEPEND="debug? ( x11-libs/wxGTK:${WX_GTK_VER}[debug] )
	mysql? ( virtual/mysql )
	postgres? ( dev-db/postgresql-base )"
RDEPEND="x11-libs/wxGTK:${WX_GTK_VER}[X]"

PATCHES=(
	"${FILESDIR}/${P}_configure.patch"
)

src_configure() {
	econf --without-clang \
		$(use_enable debug) \
		$(use_enable mysql) \
		$(use_enable pch) \
		$(use_enable postgres)
}

src_install() {
	emake -j1 DESTDIR="${D}" install || die "emake install failed"
}