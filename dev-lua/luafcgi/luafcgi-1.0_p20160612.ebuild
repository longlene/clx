# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

EGIT_COMMIT="d99ed6daa28b55b3ac7f9061b3b65c357513647c"

DESCRIPTION="FastCGI for Lua"
HOMEPAGE="https://github.com/arcapos/luafcgi"
SRC_URI="https://github.com/arcapos/luafcgi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/fcgi
"
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule fcgi.so
	dodoc luafcgi.adoc
}
