# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit lua cmake

DESCRIPTION="Very fast json module for Lua based on RapidJSON"
HOMEPAGE="https://github.com/xpol/lua-rapidjson"
SRC_URI="https://github.com/xpol/lua-rapidjson/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-cpp/rapidjson
"
