# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Portable C library for proxy support, designed to be used as a drop-in replacement for connect()"
HOMEPAGE="https://github.com/brechtsanders/proxysocket"
SRC_URI="https://github.com/brechtsanders/proxysocket/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/STRIPFLAG/{s#-s$##}' -i Makefile
}

src_install() {
	insinto /usr/include
	doins src/proxysocket.h
	dolib.so libproxysocket.so
	use static-libs && dolib.a libproxysocket.a
	dodoc README.md
}
