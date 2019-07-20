# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="f6c2242c7af2de8f40f5b6b8e50c350a138bc183"

DESCRIPTION="Embedded DHCP/DHCPv6/RA Server & Relay"
HOMEPAGE="http://wiki.openwrt.org/"
SRC_URI="https://git.openwrt.org/?p=project/odhcpd.git;a=snapshot;h=${EGIT_COMMIT};sf=tgz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="ubus"

RDEPEND="
	ubus? ( sys-apps/ubus )
	dev-libs/libubox
	sys-apps/uci
"

src_prepare() {
	default
	sed -i 's/-Werror //' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	$(cmake-utils_use ubus UBUS)
	)
	cmake-utils_src_configure
}
