# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua cmake-utils git-2

DESCRIPTION="A self contained Lua MessagePack C implementation"
HOMEPAGE=""
SRC_URI=""

EGIT_REPO_URI="https://github.com/antirez/lua-cmsgpack.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule ${BUILD_DIR}/cmsgpack.so
	dodoc README.md
}
