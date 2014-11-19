# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="Duck Programming Language"
HOMEPAGE="http://www.ducklang.org"
SRC_URI="https://github.com/gregtour/duck-lang/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
media-libs/libsdl
virtual/glu"

S="${WORKDIR}"/duck-lang-${PV}

src_install() {
	dobin bin/duck
	dobin bin/gduck
}
