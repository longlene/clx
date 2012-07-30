# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE="debug doc"

DESCRIPTION="Library for processing digital sample based MIDI instrument patch files."
HOMEPAGE="http://swami.sourceforge.net/"
MY_P="${P/_/}"
SRC_URI="mirror://sourceforge/swami/${MY_P}.tar.gz"
S="${WORKDIR}/${PN}-1.0.0"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

RDEPEND=">=dev-libs/glib-2.4
	sys-libs/zlib
	>=media-libs/audiofile-0.2.0
	media-libs/flac
	dev-python/pygtk"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_compile() {
	econf \
	$(use_enable debug) \
	$(use_enable doc gtk-doc) \
	|| die

	emake || die
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README
}
