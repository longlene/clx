# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A C++14/17/20 based HTTP web application framework"
HOMEPAGE="https://github.com/drogonframework/drogon"
SRC_URI="
	https://github.com/drogonframework/drogon/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/an-tao/trantor/archive/refs/tags/v1.5.4.tar.gz -> trantor-1.5.4.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="brotli mysql postgres redis sqlite"

DEPEND="
	dev-libs/jsoncpp
	dev-libs/openssl
	brotli? ( app-arch/brotli )
	mysql? ( dev-db/mysql )
	postgres? ( dev-db/postgres )
	redis? ( dev-libs/hiredis )
	sqlite? ( dev-db/sqltie )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir trantor && ln -sv "${WORKDIR}"/trantor-1.5.4 trantor
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_ORM=ON
		-DBUILD_EXAMPLES=OFF
		-DBUILD_BROTLI=$(usex brotli)
		-DBUILD_POSTGRESQL=$(usex postgres)
		-DLIBPQ_BATCH_MODE=$(usex postgres)
		-DBUILD_MYSQL=$(usex mysql)
		-DBUILD_SQLITE=$(usex sqlite)
		-DBUILD_REDIS=$(usex redis)
	)
	cmake_src_configure
}
