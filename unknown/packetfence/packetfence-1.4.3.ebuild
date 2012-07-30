# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp

DESCRIPTION="An open-source network-based solution to the problems posed by open
academic networks, including network registration and worm mitigation."
HOMEPAGE="http://www.packetfence.org"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="
		>=dev-db/mysql-4
		>=net-analyzer/snort-2.2.0
		dev-lang/perl
		net-dns/bind-tools
		virtual/dhcpc
		net-www/apache
		virtual/php

		dev-perl/DBD-mysql
		dev-perl/Time-HiRes
		dev-perl/Config-Simple
		
		dev-perl/Net-RawIP

		dev-perl/Net-Netmask

		dev-perl/Parse-RecDescent

		dev-perl/IO-Socket-SSL
		dev-perl/Config-IniFiles
		"
# missing perl portage packages: Parse-Plain, Net-NBName, Date-Parse,
# IPTables-IPv4, Net-Nessus-ScanLite, Net-Nessus-Client, Net-Nessus-Message

src_compile () { 
	webapp_src_preinst

	# Do file mojo

	webapp_src_install
}

src_install () { 
	webapp_pkg_postinst
}
