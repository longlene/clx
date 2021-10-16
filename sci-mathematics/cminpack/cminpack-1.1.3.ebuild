# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit toolchain-funcs cmake

DESCRIPTION="Software for solving nonlinear equations and nonlinear least squares problems"
HOMEPAGE="http://devernay.free.fr/hacks/cminpack.html"
SRC_URI="http://devernay.free.fr/hacks/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""


src_configure() {

local mycmakeargs=(
	-DBUILD_EXAMPLES=OFF                                                                                                       
	-DBUILD_EXAMPLES_FORTRAN=OFF                                                                                                       
	-DCMAKE_BUILD_TYPE=Release                                                                                                   
	-DCMAKE_INSTALL_PREFIX:PATH=/usr
	-DSHARED_LIBS=ON
	-DUSE_FPIC=ON
	)
	
	cmake_src_configure
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" || die
}

src_install() {
	cmake_src_install
}
