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
IUSE="lua systemd examples"

DEPEND="
systemd? ( sys-apps/systemd )
lua? ( dev-lang/lua )
	dev-libs/libubox[json]
"

src_prepare() {
	default
	sed -i 's/-Werror //' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	$(cmake-utils_use_build lua LUA)
	$(cmake-utils_use_build examples EXAMPLES)
	$(cmake-utils_use_enable systemd SYSTEMD)
	)

	cmake-utils_src_configure
}
