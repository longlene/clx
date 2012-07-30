# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Zoomable user interface"
HOMEPAGE="http://eaglemode.sourceforge.net/"
SRC_URI="mirror://sourceforge/eaglemode/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="jpeg png tiff xine"

DEPEND=">=dev-lang/perl-5.8
>=sys-devel/gcc-3.3
>=x11-libs/libX11-1.1.5
jpeg? ( >=media-libs/jpeg-6b-r8 )
png? ( >=media-libs/libpng-1.2.33 )
tiff? ( >=media-libs/tiff-3.8.2-r5 )
xine? ( >=media-libs/xine-lib-1.1.15-r1 )
"

RDEPEND="$DEPEND"

make_pl_buildargs() {
	echo "continue=no"
	if ! (use jpeg && use png && use tiff && use xine); then
		echo "projects=not:$(\
			use jpeg || echo -n emJpeg,; use png || echo -n emPng,;\
			use tiff || echo -n emTiff,; use xine || echo -n emAv)"
	fi
}
src_compile() {
	perl ./make.pl build continue=no $(make_pl_buildargs) || die "build failed"
}

src_install() {
	perl ./make.pl install dir="${D}/opt/eaglemode" || die "installation failed"

	dosym /opt/eaglemode/eaglemode.sh /usr/bin/eaglemode

	dodoc doc/ps/*.ps
	dohtml -r doc/html/*
}
