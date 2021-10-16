# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="A modern C++ tweening library"
HOMEPAGE="http://mobius3.github.io/tweeny"
SRC_URI="https://github.com/mobius3/tweeny/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example doc"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DTWEENY_BUILD_EXAMPLESA=$(usex example)
	-DTWEENY_BUILD_DOCUMENTATION=$(usex doc)
	)
	cmake_src_configure
}
