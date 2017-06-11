# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A simple and easy-to-use library to learn videogames programming"
HOMEPAGE="http://www.raylib.com"
SRC_URI="https://github.com/raysan5/raylib/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	local target
	target+="PLATFORM=PLATFORM_DESKTOP"
	use static || target+=" SHARED=YES"
	emake -C src ${target} 
}

src_install() {
	if use static ; then
		dolib.a release/linux/libraylib.a
	else
		dolib.so release/linux/libraylib.so
	fi
	insinto /usr/include
	doins release/linux/raylib.h
	dodoc README.md
}
