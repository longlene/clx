# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils

DESCRIPTION="Parallel dump/import from/to MySQL"
HOMEPAGE="http://www.mydumper.org"
SRC_URI="http://launchpad.net/mydumper/0.5/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND=">=virtual/mysql-5.1
	>=dev-libs/glib-2.28.6
	>=sys-libs/zlib-1.2.5-r2
	>=dev-libs/libpcre-8.12"
RDEPEND="${DEPEND}
	doc? ( dev-python/sphinx )"

CMAKE_IN_SOURCE_BUILD=1

DOCS="README"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build doc DOCS)
	)
	cmake-utils_src_configure
}

pkg_postinst() {
	einfo
	einfo "You might want to have a look at"
	einfo "http://devdocs.mydumper.org/"
	einfo "on how to get started with Mydumper."
	einfo
}
