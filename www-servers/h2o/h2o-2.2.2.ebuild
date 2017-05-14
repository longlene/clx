# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="H2O - the optimized HTTP/1, HTTP/2 server"
HOMEPAGE="https://h2o.examp1e.net/"
SRC_URI="https://github.com/h2o/h2o/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static"

DEPEND="
	dev-libs/libuv
	dev-libs/openssl
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DWITH_BUNDLED_SSL=OFF
	-DBUILD_SHARED_LIBS=$(usex !static)
	)
	cmake-utils_src_configure
}