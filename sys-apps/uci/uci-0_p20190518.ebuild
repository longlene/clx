# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="f199b961c2970b63cc83947ad49b327b3f48f05f"

DESCRIPTION="OpenWrt Unified Configuration Interface"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI="https://git.openwrt.org/?p=project/uci.git;a=snapshot;h=${EGIT_COMMIT};sf=tgz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="lua"

DEPEND="
	dev-libs/libubox
"

src_prepare() {
	default
	sed -e 's/-Werror //' \
		-e "s/DESTINATION lib/DESTINATION $(get_libdir)/" \
		-i CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DBUILD_LUA=$(usex lua)
	)

	cmake-utils_src_configure
}
