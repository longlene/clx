# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils vcs-snapshot

DESCRIPTION="C++11 port of docopt"
HOMEPAGE="https://github.com/docopt/docopt.cpp"
SRC_URI="https://github.com/docopt/docopt.cpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT Boost"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example static test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use static || sed -i '/docopt_s/d' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DWITH_TESTS=$(usex test)
	-DWITH_EXAMPLE=$(usex example)
	)
	cmake-utils_src_configure
}
