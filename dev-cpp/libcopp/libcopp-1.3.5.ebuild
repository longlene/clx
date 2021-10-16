# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="cross-platform coroutine library in c++"
HOMEPAGE="https://github.com/owt5008137/libcopp"
SRC_URI="https://github.com/owt5008137/libcopp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="example test"

DEPEND="
	test? ( dev-cpp/gtest )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DPROJECT_ENABLE_SAMPLE=$(usex example)
	-DPROJECT_ENABLE_UNITTEST=$(usex test)
	)
	cmake_src_configure
}
