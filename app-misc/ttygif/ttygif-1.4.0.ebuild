# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Convert terminal recordings to animated gifs"
HOMEPAGE="https://github.com/icholy/ttygif"
SRC_URI="https://github.com/icholy/ttygif/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-gfx/imagemagick
"

src_install() {
	dobin ttygif
	dodoc README.md
}
