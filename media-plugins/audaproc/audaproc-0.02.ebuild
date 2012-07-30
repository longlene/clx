# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Audacious Plugin for lcdproc"
HOMEPAGE="http://www.iowa.user.icpnet.pl/jacek/audaproc/"
SRC_URI="http://www.icpnet.pl/~iowa/jacek/releases/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"
DEPENDS=">=media-sound/audacious-1.3.0
	 >=app-misc/lcdproc-0.5.0"

src_unpack() {
  unpack ${A}
  cd "${S}"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install || die
}

