# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Modern key-value/row storage library"
HOMEPAGE="http://sophia.systems/"
SRC_URI="https://github.com/pmwkaa/sophia/archive/version_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}-version_${PV}

src_prepare() {
	eapply_user
	sed -i -e '/git/ s/^/#/' -e 's/$build\>/a0837ea/' sophia/build
	sed -i '/strip/d' makefile
}

src_install() {
	dolib.so libsophia.so*
	use static-libs && dolib.a
	insinto /usr/include
	doins sophia.h
}
