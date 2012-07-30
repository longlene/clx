# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Decoding library for BMP and ICO imgage file formats"
HOMEPAGE="http;//www.netsurf-browser.org/projects/libnsbmp"
SRC_URI="http://www.netsurf-browser.org/projects/releases/libnsbmp-${PV}-src.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
emake || die "make failed"
}

src_install() {
emake DESTDIR="${D}" PREFIX="/usr" install || die "Install Failed"
}
