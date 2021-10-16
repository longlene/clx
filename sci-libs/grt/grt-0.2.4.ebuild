# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake

DESCRIPTION="gesture recognition toolkit"
HOMEPAGE="https://github.com/nickgillian/grt"
SRC_URI="https://github.com/nickgillian/grt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}"/build

src_configure() {
	eapply_user
	local mycmakeargs=(
	-DBUILD_EXAMPLES=$(usex example)
	-DBUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}
