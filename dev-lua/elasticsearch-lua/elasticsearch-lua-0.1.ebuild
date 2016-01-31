# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua

DESCRIPTION="Lua client for elasticsearch"
HOMEPAGE="https://github.com/DhavalKapil/elasticsearch-lua"
SRC_URI="mirror://github/DhavalKapil/elasticsearch-lua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luasocket
dev-lua/lua-cjson
dev-lua/lunitx
"

src_install() {
	lua_install_module -r elasticsearch
}
