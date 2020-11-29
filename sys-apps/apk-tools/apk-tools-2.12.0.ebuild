# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

DESCRIPTION="Alpine Package Keeper"
HOMEPAGE="https://github.com/alpinelinux/apk-tools"
SRC_URI="https://github.com/alpinelinux/apk-tools/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i 's/-Werror//' Make.rules
	sed -i 's#TLS_client_method#SSLv23_client_method#' libfetch/common.c
}

src_configure() {
	lua_version
	export LUA_VERSION=${LUAVER}
	export LUA_PC=lua
	export LUA_LIBDIR=$(lua_get_libdir)
}
