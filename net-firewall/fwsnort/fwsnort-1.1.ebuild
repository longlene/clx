# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Uses Snort to generate an iptables rule set"
HOMEPAGE="http://www.cipherdyne.org/fwsnort/"
SRC_URI="http://www.cipherdyne.org/${PN}/download/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/perl
	dev-perl/IPTables-Parse
	dev-perl/Net-IPv4Addr
	net-firewall/iptables"

src_install(){
	insinto /etc/${PN}
	doins ${PN}.conf || die

	insinto /usr/share/${PN}
	doins deps/snort_rules/*.rules || die

	dosbin ${PN} || die
	fperms 500 /usr/sbin/${PN} || die
	doman *.8 || die
	dodoc README ChangeLog TODO || die
}

pkg_postinst(){
	elog "The default rules for {$PN} were put in /usr/share/${PN}."
	elog "If you would like to use any of them just copy them into"
	elog "/etc/${PN}/snort_rules."
	elog
	elog "If you would like the ruleset for the latest emerging"
	elog "threats, and you trust emergingthreats.net to not add"
	elog "any malicious rules, setup a cron job to fetch"
	elog "http://www.emergingthreats.net/rules/emerging-all.rules"
	elog "and put it in /etc/${PN}/snort_rules/"
}
