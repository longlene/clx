# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit eutils toolchain-funcs flag-o-matic multilib versionator cmake-utils

MY_P="${P/_}"
MY_DOCP="${PN}-$(get_version_component_range 1-3)-all-doc"

DESCRIPTION="C++ class libraries to simplify the development of network-centric, portable applications."
HOMEPAGE="http://pocoproject.org/"
SRC_URI="http://pocoproject.org/releases/${P}/${MY_P}-all.tar.gz
	doc? ( http://pocoproject.org/releases/${P}/${MY_DOCP}.tar.gz )"
LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc iodbc mysql odbc sqlite mongodb ssl test"

DEPEND=">=dev-libs/libpcre-8.13
	dev-libs/expat
	sys-libs/zlib
	mysql? ( virtual/mysql )
	odbc? ( iodbc? ( dev-db/libiodbc )
		!iodbc? ( dev-db/unixODBC ) )
	ssl? ( dev-libs/openssl )
	sqlite? ( dev-db/sqlite:3 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}-all"

src_configure() {
	local mycmakeargs=(
	-DENABLE_NETSSL=$(usex ssl)
	-DENABLE_MONGODB=$(usex mongodb)
	-DENABLE_DATA_SQLITE=$(usex sqlite)
	-DENABLE_DATA_MYSQL=$(usex mysql)
	-DENABLE_DATA_ODBC=$(usex odbc)
	-DENABLE_TESTS=$(usex test)
	-DPOCO_UNBUNDLED=ON
	)
	cmake-utils_src_configure
}

