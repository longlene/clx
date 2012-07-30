# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

MY_P=${PN}_${PV}

DESCRIPTION="A flexible, cross-platform scripting library"
HOMEPAGE="http://www.angelcode.com/angelscript/"
SRC_URI="http://www.angelcode.com/${PN}/sdk/files/${MY_P}.zip"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

DEPEND=""

S=${WORKDIR}/sdk/${PN}/projects/gnuc

src_compile() {
	emake \
		CXX=$(tc-getCXX) \
		CXXFLAGS="${CXXFLAGS}" \
		|| die "emake failed"
}

src_install() {
	dodir /usr/lib
	dodir /usr/include
	make LOCAL="${D}/usr" install || die "make install failed"
	cd ${WORKDIR}/sdk
	useq doc && dohtml -r docs
}

