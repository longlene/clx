# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="MongoDB Driver for Lua"
HOMEPAGE="https://github.com/neoxic/lua-mongo"
SRC_URI="https://github.com/neoxic/lua-mongo/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/mongo-c-driver
"
RDEPEND="${DEPEND}"
