# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit cmake

DESCRIPTION="Duck Programming Language"
HOMEPAGE="http://www.ducklang.org"
SRC_URI="https://github.com/gregtour/duck-lang/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
S="${WORKDIR}"/duck-lang-${PV}
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}
	media-libs/sdl-gfx
"

src_install() {
	dobin bin/duck
	dobin bin/gduck
}
