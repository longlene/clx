# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit linux-mod

DESCRIPTION="Intel (R) PRO/Wireless 3945ABG Network Drivers"
HOMEPAGE="http://homepages.tu-darmstadt.de/~p_larbig/wlan/"
SRC_URI="http://homepages.tu-darmstadt.de/~p_larbig/wlan/${P/_p/-}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=virtual/linux-sources-2.6.22"
RDEPEND="=net-wireless/iwl3945-ucode-2.14.4"

S="${PN}"

pkg_setup() {
	if kernel_is lt 2 6 22 ; then
		eerror "iwlwifi requires a kernel >=2.6.22."
		eerror "Please set your /usr/src/linux symlink accordingly."
		die "invalid /usr/src/linux symlink"
	else
		CONFIG_CHECK="MAC80211"
	fi

	BUILD_TARGETS="all"
	MODULE_NAMES="ipwraw(net/wireless:${S}:${S})"

	linux-mod_pkg_setup

}

src_compile() {
	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install

	cd ${S}
	dobin util/wifi_tx
	dodoc CHANGELOG.ipwraw-ng CHANGES ISSUES README.ipwraw README.ipwraw-ng
}
