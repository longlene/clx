# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="A small library that implements a \"channel\" construct for inter-thread communication in C"
HOMEPAGE="http://repo.hu/projects/cchan"
SRC_URI="http://repo.hu/projects/cchan/releases/cchan-${PV}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="sdl"

DEPEND="sdl? ( media-libs/libsdl )"
RDEPEND="${DEPEND}"

src_compile() {
	make cchan_pthread.a
	use sdl && make cchan_sdl.a
}

src_install() {
	mv cchan_pthread.a libcchan_pthread.a
	insinto /usr/include
	doins cchan.h cchan_pthread.h cchan_api_pthread.h
	dolib.a libcchan_pthread.a
	if use sdl ; then
		mv cchan_sdl.a libcchan_sdl.a
		insinto /usr/include
		doins cchan_sdl.h cchan_api_sdl.h
		dolib.a libcchan_sdl.a
	fi
	dodoc README
	dohtml doc/index.html
}
