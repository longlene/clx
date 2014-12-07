# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="A pixelart-oriented painting program"
HOMEPAGE="http://code.google.com/p/grafx2/"
SRC_URI="http://grafx2.googlecode.com/files/${P}-src.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="ttf lua"

DEPEND="media-libs/libsdl
	media-libs/sdl-image
	media-libs/freetype
	media-libs/libpng
	ttf? ( media-libs/sdl-ttf )
	lua? ( >=dev-lang/lua-5.1.0 )"
RDEPEND=""

src_prepare() {
	cd ${WORKDIR}/${PN}/src/
	sed -i s/lua5\.1/lua/g Makefile
}
src_compile() {
	use ttf || MYCNF="NOTTF=1"
	use lua || MYCNF="${MYCNF} NOLUA=1"
	cd ${WORKDIR}/${PN}/src/
	emake ${MYCNF} || die "emake failed"
}

src_install() {
	cd ${WORKDIR}/${PN}/src/
	emake DESTDIR="${D}" PREFIX="/usr" install || die "Install failed"
}

pkg_postinst() {
	elog "Please report bugs upstream:"
	elog " http://code.google.com/p/grafx2"
}
