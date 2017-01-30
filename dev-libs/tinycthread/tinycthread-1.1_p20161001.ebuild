# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="6957fc8383d6c7db25b60b8c849b29caab1caaee"

DESCRIPTION="Small, portable implementation of the C11 threads API"
HOMEPAGE="https://tinycthread.github.io/"
SRC_URI="https://github.com/tinycthread/tinycthread/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DTINYCTHREAD_DISABLE_TESTS=$(usex !test)
	-DTINYCTHREAD_INSTALL=ON
	)
	cmake-utils_src_configure
}

