# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Highly scalable WebSocket server library"
HOMEPAGE="https://github.com/uWebSockets/uWebSockets/"
SRC_URI="https://github.com/uWebSockets/uWebSockets/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="
	dev-libs/libuv
	dev-libs/openssl
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use examples || sed -i '/add_subdirectory/{/examples/d}' CMakeLists.txt
}
