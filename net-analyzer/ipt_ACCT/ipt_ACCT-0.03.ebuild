# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-mod

DESCRIPTION="Accounting module for iptables"
HOMEPAGE="http://ipt-acct.berlios.de"
SRC_URI="http://download.berlios.de/ipt-acct/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=">=net-firewall/iptables-1.3.0"
DEPEND="${RDEPEND}"

pkg_setup() {
	CONFIG_CHECK="IP_NF_IPTABLES"
	BUILD_PARAMS="KERNEL_SOURCES=\"${KERNEL_DIR}\""
	if kernel_is 2 4
	then
		BUILD_PARAMS="${BUILD_PARAMS} OLD_KERNEL=1"
	elif ! kernel_is 2 6
	then
		eerror "Unsupported kernel version ${KV}."
	fi
	MODULE_NAMES="ipt_ACCT(net/ipv4/netfilter)"
	BUILD_TARGETS="all"
	linux-mod_pkg_setup
}

src_install() {
	linux-mod_src_install
	exeinto /$(get_libdir)/iptables
	doexe libipt_ACCT.so
	insinto /usr/include
	doins ipt_ACCT.h
	dobin dump_ipt_acct
	dosbin stat_ipt_acct
	dodoc AUTHORS README
}

