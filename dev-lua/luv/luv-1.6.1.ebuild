# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua cmake-utils

DESCRIPTION="Bare libuv bindings for lua"
HOMEPAGE="https://github.com/luvit/luv"
SRC_URI="mirror://github/luvit/luv/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/libuv
"

src_configure() {
	local mycmakeargs=(
	-DWITH_SHARED_LIBUV=ON
	-DLUA_BUILD_TYPE=System
	)
	cmake-utils_src_configure
}

