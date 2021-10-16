# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake

DESCRIPTION="A C++11 RESTful web server library"
HOMEPAGE="https://github.com/datasift/served"
SRC_URI="https://github.com/datasift/served/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND="
	dev-libs/boost
	dev-libs/re2
	dev-util/ragel
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DSERVED_BUILD_TESTS=$(usex test)
	-DSERVED_BUILD_EXAMPLES=$(usex example)
	)
	cmake_src_configure
}
