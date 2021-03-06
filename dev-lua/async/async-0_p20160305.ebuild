# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_COMMIT="293348b5aef029b8ca29269f96c8a8fe9bde33ce"

inherit lua vcs-snapshot

DESCRIPTION="An async framework for Lua/Torch"
HOMEPAGE="https://github.com/clementfarabet/async"
SRC_URI="https://github.com/clementfarabet/async/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/lua-cjson
	sci-libs/torch7
"

DOCS=( README.md )

each_lua_install() {
	dolua async luv/luv.so lhttp_parser/lhttp_parser.so
}
