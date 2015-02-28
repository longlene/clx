# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A simple 2D graphics engine"
HOMEPAGE="http://simple2d.com"
SRC_URI="https:/github.com/simple2d/simple2d/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
media-libs/libsdl2
media-libs/sdl2-image
media-libs/sdl2-mixer
media-libs/sdl2-ttf
"
RDEPEND="${DEPEND}"

src_install() {
	dolib.a build/libsimple2d.a
	insinto /usr/include
	doins include/simple2d.h
}
