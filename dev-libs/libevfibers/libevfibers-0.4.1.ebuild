# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Small C fiber library that uses libev based event loop and libcoro based coroutine context switching"
HOMEPAGE="https://github.com/Lupus/libevfibers"
SRC_URI="https://github.com/Lupus/libevfibers/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/libev
"
RDEPEND="${DEPEND}"
