# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils linux-mod

OPENDPI_VER="opendpi-1.2.0"
DESCRIPTION="Netfilter wrapper for OpenDPI library."
HOMEPAGE="http://opendpi.org/"
SRC_URI="http://opendpi.googlecode.com/files/${P}.tar.gz
	http://opendpi.googlecode.com/files/${OPENDPI_VER}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=net-firewall/iptables-1.4.1"
DEPEND="${RDEPEND}"

S="${S}/wrapper"

MODULE_NAMES="xt_opendpi(extra:${S}:${S}/src)"
BUILD_TARGETS=" "

CONFIG_CHECK="NETFILTER NF_CONNTRACK_EVENTS !NF_CT_NETLINK"
ERROR_NETFILTER="${PN} requires Netfilter support in your kernel."
ERROR_NF_CONNTRACK_EVENTS="${PN} requires Connection tracking events support in your kernel."
ERROR_NF_CT_NETLINK="${PN} requires disabled Connection tracking netlink interface option in your kernel."

src_prepare() {
	epatch "${FILESDIR}/${P}_2.6.35_v2.patch.gz"

	cd "${WORKDIR}/${OPENDPI_VER}" || die
	epatch "${WORKDIR}/${P}/ipq_main.h.diff"
	epatch "${WORKDIR}/${P}/ipq_protocols.h.diff"
}

src_compile() {
	export OPENDPI_PATH="${WORKDIR}/${OPENDPI_VER}"
	linux-mod_src_compile
}

src_install() {
	exeinto "/$(get_libdir)/xtables"
	doexe "ipt/libxt_opendpi.so" || die

	linux-mod_src_install

	dodoc README INSTALL AUTHORS || die
}

pkg_postinst() {
	linux-mod_pkg_postinst

	elog
	elog "See output of 'iptables -m opendpi --help' for help on using and the options available."
	elog
}
