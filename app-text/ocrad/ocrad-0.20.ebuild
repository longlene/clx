# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="GNU Ocrad is an OCR (Optical Character Recognition) program based on a
feature extraction method."
HOMEPAGE=""
SRC_URI="http://ftp.gnu.org/gnu/ocrad/ocrad-0.20.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

src_configure()
{
	econf CXXFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}
src_compile()
{
	emake || die
}
src_install()
{
	emake DESTDIR=$D install || die “message”
}