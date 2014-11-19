# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

NEED_LUA=5.1
inherit lua

DESCRIPTION="lua-MessagePack : a pure Lua implementation"
HOMEPAGE="http://fperrad.github.io/lua-MessagePack/"
SRC_URI="https://github.com/fperrad/lua-MessagePack/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake PREFIX="${D}"/usr install
}
