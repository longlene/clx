# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit linux-mod

DESCRIPTION="Fast kernel-land pseudo-random number generator using the RC4 algorithm"
HOMEPAGE="http://billauer.co.il/frandom.html"
SRC_URI="mirror://sourceforge/project/frandom/frandom/${P}/${P}.tar.gz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="strip"

BUILD_TARGETS="default"
BUILD_TARGET_ARCH="${ARCH}"
MODULE_NAMES="frandom(misc)"

src_prepare() {
	sed -i -e "s:\$(shell uname -r):${KV_FULL}:" "${S}"/Makefile || die "sed failed" 
}

src_install() {
		linux-mod_src_install

		# udev rule for vboxdrv
		dodir /etc/udev/rules.d
		echo 'KERNEL=="frandom", OWNER="root", GROUP="root", MODE="0660"' \
		>> "${D}/etc/udev/rules.d/60-frandom.rules"
		echo 'KERNEL=="erandom", OWNER="root", GROUP="root", MODE="0660"' \
		>> "${D}/etc/udev/rules.d/60-frandom.rules"
}
