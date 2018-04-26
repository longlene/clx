# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="a8be8637db642a68727dd1fb57c2fa79af3cf900"

DESCRIPTION="C++React: A reactive programming library for C++11"
HOMEPAGE="https://github.com/schlangster/cpp.react"
SRC_URI="https://github.com/schlangster/cpp.react/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/tbb
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-Dbuild_examples=OFF
	)
	cmake-utils_src_configure
}
