# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake

DESCRIPTION="A type safe SQL template library for C++"
HOMEPAGE="https://github.com/rbock/sqlpp11"
SRC_URI="https://github.com/rbock/sqlpp11/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND="dev-cpp/date"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DENABLE_TESTS=$(usex test)
	)
	cmake_src_configure
}
