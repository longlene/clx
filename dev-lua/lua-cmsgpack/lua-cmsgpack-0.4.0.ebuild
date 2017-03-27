# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils lua

DESCRIPTION="A self contained Lua MessagePack C implementation"
HOMEPAGE="https://github.com/antirez/lua-cmsgpack"
SRC_URI="https://github.com/antirez/lua-cmsgpack/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule ${BUILD_DIR}/cmsgpack.so
	dodoc README.md
}
