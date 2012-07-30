# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit autotools eutils games

DESCRIPTION="A flexible frontend for video game emulators"
HOMEPAGE="http://gelide.sourceforge.net/"
SRC_URI="mirror://sourceforge/gelide/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug nls"

RDEPEND="app-text/gnome-doc-utils
	dev-cpp/gtkmm
	dev-libs/libxml2
	dev-util/intltool
	nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	nls? ( sys-devel/gettext )"

src_prepare() {
	# Set emulator paths to gentoo default
	sed -i \
		-e "s;l_emulator\.setPath(\"[/a-z]*/;l_emulator\.setPath(\"${GAMES_BINDIR}/;" \
		src/core/default_systems.cpp || die
	epatch "${FILESDIR}"/${P}-build.patch
	eautoreconf
}

src_configure() {
	egamesconf \
		--disable-dependency-tracking \
		--docdir=/usr/share/doc/${PF} \
		--localedir=/usr/share/locale \
		--with-omf-dir=/usr/share/omf/${PN} \
		--with-help-dir=/usr/share/gnome/help/${PN} \
		--disable-scrollkeeper \
		$(use_enable debug) \
		$(use_enable nls)
}

src_install() {
	emake DESTDIR="${D}" install || die
	insinto "${GAMES_DATADIR}"/${PN}
	doins ChangeLog
	dodoc AUTHORS COPYING ChangeLog NEWS README doc/*.txt
	prepgamesdirs
}
