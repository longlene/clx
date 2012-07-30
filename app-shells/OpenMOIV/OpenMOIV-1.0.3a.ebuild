# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils

DESCRIPTION="Object-oriented 3D toolkit that facilitates the rendering and interaction of chemical systems."
HOMEPAGE="http://www.tecn.upf.es/openMOIV/"
SRC_URI="http://www.tecn.upf.es/openMOIV/download/1.0.3/OpenMOIV.src.1.0.3a.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""

RDEPEND="media-libs/coin"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}.src.${PV/a//}"

src_configure() {
	mycmakeargs="${mycmakeargs} -Dshared:int=1 -Dcoin:int=1 -Dsys_fonts:int=1"
	cmake-utils_src_configure
}

src_install() {
	insinto "$(get_libdir)"
	doins "${CMAKE_BUILD_DIR}/libChemKit2.so" || die "doins for libChemKit2 failed"

	mkdir -p "${D}/usr/include"  || die "mkdir failed"
	cp -pR "${S}/include/ChemKit2" "${D}/usr/include" || die "include install failed"
}
