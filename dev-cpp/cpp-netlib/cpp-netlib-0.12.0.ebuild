# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="A collection of open-source libraries for high level network programming"
HOMEPAGE="http://cpp-netlib.org"
SRC_URI="http://downloads.cpp-netlib.org/${PV}/${P}-final.tar.gz"

LICENSE="Boost"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example +ssl test"

DEPEND="
	dev-libs/boost[threads]
	ssl? ( dev-libs/openssl )
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${P}-final

src_configure() {
	local mycmakeargs=(
	$(cmake-utils_use example CPP-NETLIB_BUILD_EXAMPLES)
	$(cmake-utils_use ssl CPP-NETLIB_BUILD_HTTPS)
	$(cmake-utils_use test CPP-NETLIB_BUILD_TESTS)
	)
	cmake-utils_src_configure
}
