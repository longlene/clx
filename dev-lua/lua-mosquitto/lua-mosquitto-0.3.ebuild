# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua

DESCRIPTION="Lua bindings to the [libmosquitto]"
HOMEPAGE="https://github.com/flukso/lua-mosquitto"
SRC_URI="https://github.com/flukso/lua-mosquitto/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-misc/mosquitto
"
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule mosquitto.so
	dodoc README.md
}
