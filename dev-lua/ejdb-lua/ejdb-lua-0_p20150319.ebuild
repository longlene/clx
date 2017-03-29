# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="c670194df81cb7da78b9031a77b8e9987f377d2a"

DESCRIPTION="EJDB Lua binding"
HOMEPAGE="https://github.com/Softmotions/ejdb-lua"
SRC_URI="https://github.com/Softmotions/ejdb-lua/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/ejdb
"
RDEPEND="${DEPEND}"

src_compile() {
	$(tc-getCC) -fPIC -shared -o ejdb.so luabson.c luaejdb.c || die "compile error"
}


src_install() {
	lua_install_module -r ejdb{,.lua}
	lua_install_cmodule ejdb.so
	dodoc README.md
}
