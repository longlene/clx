# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua

DESCRIPTION="Lua client for elasticsearch"
HOMEPAGE="https://github.com/DhavalKapil/elasticsearch-lua"
SRC_URI="https://github.com/DhavalKapil/elasticsearch-lua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luasocket
	dev-lua/lua-cjson
	dev-lua/lunitx
"

src_install() {
	lua_install_module -r src/elasticsearch
	dodoc README.md
}
