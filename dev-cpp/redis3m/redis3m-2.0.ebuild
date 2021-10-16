# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake

DESCRIPTION="A C++ Redis client"
HOMEPAGE="https://github.com/luca3m/redis3m"
SRC_URI="https://github.com/luca3m/redis3m/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost[threads]
	dev-libs/hiredis
	dev-libs/msgpack
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/install/{/lua/d}' CMakeLists.txt
}
