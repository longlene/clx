# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake

DESCRIPTION="C++ network library based on libgo"
HOMEPAGE="https://github.com/yyzybb537/libgonet"
SRC_URI="https://github.com/yyzybb537/libgonet/archive/v${PV}-stable.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="ssl"

DEPEND="
	dev-libs/boost[context]
	dev-cpp/libgo
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}-stable"

src_prepare() {
	eapply_user
	sed -e '/include_directories/{s#${PROJECT_SOURCE_DIR}/third_party#/usr/include#}' \
		-e '/CMAKE_INSTALL_PREFIX/{s#local##}' \
		-i CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DENABLE_SSL=$(usex ssl)
	-DNO_SUB=ON
	)
	cmake_src_configure
}
