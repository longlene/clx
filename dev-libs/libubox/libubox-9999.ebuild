# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="A general purpose library for the OpenWRT project."
HOMEPAGE="http://wiki.openwrt.org/"
EGIT_REPO_URI="git://nbd.name/luci2/${PN}.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="lua +json"

RDEPEND="lua? ( dev-lang/lua )
json? ( dev-libs/json-c )"

src_prepare() {
	sed -i 's/-Werror //' CMakeLists.txt
	sed -i 's|\<json/json.h\>|json-c/json.h|' jshn.c blobmsg_json.h
	sed -i '/PKG_CHECK_MODULES/ s|json-c json|json-c|' CMakeLists.txt
	echo 'INCLUDE_DIRECTORIES(/usr/include/libnl3)' >> CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	$(cmake-utils_use_build lua LUA)
	$(cmake-utils_use json JSONC_FOUND)
	)
	cmake-utils_src_configure
}
