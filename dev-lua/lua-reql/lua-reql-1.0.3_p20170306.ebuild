# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="81a35f1a111a7c20558492c4ee814b7418fa98ed"

DESCRIPTION="Rethinkdb driver in Lua"
HOMEPAGE="https://github.com/grandquista/Lua-ReQL"
SRC_URI="https://github.com/grandquista/Lua-ReQL/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lua/luacrypto
	dev-lua/luasocket
	dev-lua/luasec
	dev-lua/luajson
"
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module -r src/rethinkdb{,.lua}
	dodoc README.md
}
