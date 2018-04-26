# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="C library that resolves names asynchronously"
HOMEPAGE="http://c-ares.haxx.se/"
SRC_URI="http://${PN}.haxx.se/download/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc64-solaris"
IUSE="static-libs"

SLOT="0/2"

src_configure() {
	local mycmakeargs=(
	-DCARES_STATIC=$(usex static-libs)
	)
	cmake-utils_src_configure
}

