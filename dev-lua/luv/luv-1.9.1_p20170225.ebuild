# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils lua vcs-snapshot

EGIT_COMMIT="c3f5d43e862f6b304fe70bab6711d7fa383a92f1"

DESCRIPTION="Bare libuv bindings for lua"
HOMEPAGE="https://github.com/luvit/luv"
SRC_URI="https://github.com/luvit/luv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/libuv
"

src_configure() {
	local mycmakeargs=(
	-DBUILD_MODULE=OFF
	-DBUILD_SHARED_LIBS=ON
	-DWITH_SHARED_LIBUV=ON
	-DLUA_BUILD_TYPE=System
	)
	cmake-utils_src_configure
}

