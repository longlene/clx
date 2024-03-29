# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="DataStax C/C++ Driver for Cassandra"
HOMEPAGE="https://datastax.github.io/cpp-driver/"
SRC_URI="https://github.com/datastax/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl"

RDEPEND="
	dev-libs/libuv:=
	ssl? (
		dev-libs/openssl:0=
	)"
DEPEND="${RDEPEND}"

CMAKE_MAKEFILE_GENERATOR="emake"

src_configure() {
	local mycmakeargs=( -DCASS_USE_OPENSSL=$(usex ssl) )
	cmake_src_configure
}
