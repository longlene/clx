# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="8221be35699141684d742bdffa8a55152546ac94"

DESCRIPTION="Alpine Package Keeper"
HOMEPAGE="https://github.com/alpinelinux/apk-tools"
SRC_URI="https://github.com/alpinelinux/apk-tools/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libfetch
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i 's/-Werror//' Make.rules
}

src_configure() {
	lua_version
	export LUA_VERSION=${LUAVER}
	export LUA_PC=lua
	export LUA_LIBDIR=$(lua_get_libdir)
}
