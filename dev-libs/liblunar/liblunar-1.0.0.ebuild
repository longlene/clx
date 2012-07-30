# Copyright 2006-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Chinese Lunar library."
HOMEPAGE="http://code.google.com/p/liblunar/"
SRC_URI="http://liblunar.googlecode.com/files/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"
IUSE="python"

RDEPEND=">=dev-libs/atk-1.20.0
		>=x11-libs/cairo-1.2.4
		>=media-libs/fontconfig-2.4.0
		>=media-libs/freetype-2.3.5
		>=dev-libs/glib-2.17.3
		>=x11-libs/gtk+-2.13.3
		>=x11-libs/pango-1.21.3
		>=sys-libs/zlib-1.1.4
		python? ( dev-lang/python )
		"

DEPEND="${RDEPEND}"

src_compile() {
	econf $(use_enable python) \
		|| die "Configuration failed"

	emake || die "Compilation failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Installation failed"
}
