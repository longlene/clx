# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake

DESCRIPTION="Wt, C++ Web Toolkit"
HOMEPAGE="http://www.webtoolkit.eu/wt"
SRC_URI="https://github.com/emweb/wt/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example firebird mysql opengl pango pdf postgres qt4 ssl test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/sqlite
	firebird? ( dev-db/firebird )
	mysql? ( virtual/mysql )
	opengl? ( virtual/opengl )
	pango? ( x11-libs/pango )
	pdf? ( media-libs/libharu )
	ssl? ( dev-libs/openssl )
	dev-libs/boost
"

src_prepare() {
	eapply_user
	sed -i "/SET(LIB_INSTALL_DIR/{s#\"lib\"#\"$(get_libdir)\"#}" CMakeLists.txt
	sed -i '1,$d' WtInstall.cmake
}

src_configure() {
	local mycmakeargs=(
	-DBUILD_EXAMPLES=$(usex example)
	-DINSTALL_EXAMPLES=$(usex example)
	-DENABLE_SSL=$(usex ssl)
	-DENABLE_HARU=$(usex pdf)
	-DENABLE_PANGO=$(usex pango)
	-DENABLE_POSTGRES=$(usex postgres)
	-DENABLE_FIREBIRD=$(usex firebird)
	-DENABLE_MYSQL=$(usex mysql)
	-DENABLE_QT4=$(usex qt4)
	-DENABLE_OPENGL=$(usex opengl)
	)
	cmake_src_configure
}
