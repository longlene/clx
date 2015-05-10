# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Modern emeddable key-value database"
HOMEPAGE="http://sphia.org"
SRC_URI="https://github.com/pmwkaa/sophia/archive/version_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}-version_${PV}

src_prepare() {
	sed -i -e '/git/ s/^/#/' -e 's/$build\>/a0837ea/' sophia/build
	sed -i '/strip/d' makefile
}

src_install() {
	dolib.so libsophia.so*
	use static-libs && dolib.a
	insinto /usr/include
	doins sophia.h
}
