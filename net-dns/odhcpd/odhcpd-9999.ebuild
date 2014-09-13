# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-2 cmake-utils

DESCRIPTION="Embedded DHCP/DHCPv6/RA Server & Relay"
HOMEPAGE="http://wiki.openwrt.org/"
EGIT_REPO_URI="https://github.com/sbyx/odhcpd.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ubus"

RDEPEND="ubus? ( sys-apps/ubus )
dev-libs/libubox
sys-apps/uci"

src_prepare() {
	sed -i 's/-Werror //' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	$(cmake-utils_use ubus UBUS)
	)
	cmake-utils_src_configure
}
