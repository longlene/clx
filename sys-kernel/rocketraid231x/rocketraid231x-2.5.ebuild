# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-mod

DESCRIPTION="Kernel module for Highpoint RocketRaid 231x raid cards"
SRC_URI="http://www.support-highpoint-tech.com/Main/rr231x_00/Linux/opensrc/rr231x_0x-linux-src-v${PV}-091022-1618.tar.gz"
HOMEPAGE="http://www.highpoint-tech.com/USA/rr2310.htm"
KEYWORDS="~x86"
SLOT="0"
LICENSE=""
IUSE=""

S="${WORKDIR}/rr231x_0x-linux-src-v${PV}"
BUILD_PARAMS=" "
BUILD_TARGETS=" "

pkg_setup() {
	linux-mod_pkg_setup

	MODULE_NAMES="rr2310_00(raid:${S}/product/rr2310pm/linux:${S}/product/rr2310pm/linux)"
}

scr_unpack() {
	unpack ${A}
}

src_install() {
	linux-mod_src_install
}
