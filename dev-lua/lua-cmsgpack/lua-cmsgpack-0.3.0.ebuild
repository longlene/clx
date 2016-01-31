# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua cmake-utils

DESCRIPTION="A self contained Lua MessagePack C implementation"
HOMEPAGE="https://github.com/fperrad/lua-MessagePack"
SRC_URI="https://github.com/fperrad/lua-MessagePack/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/lua-MessagePack-${PV}

src_install() {
	lua_install_cmodule ${BUILD_DIR}/cmsgpack.so
	dodoc README.md
}
