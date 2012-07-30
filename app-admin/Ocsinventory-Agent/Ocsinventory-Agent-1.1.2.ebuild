# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit perl-module

DESCRIPTION="Powerful inventory and package deployment system"
HOMEPAGE="http://www.ocsinventory-ng.org/index.php?page=English"
SRC_URI="http://launchpad.net/ocsinventory-unix-agent/stable/ocsinventory-unix-agent-${PV}/+download/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="logrotate"

src_install() { 
	mytargets=pure_install
	perl-module_src_install
	insinto /etc/ocsinventory-agent
	doins etc/ocsinventory-agent/modules.conf || die
	insinto /etc/cron.d
	doins etc/cron.d/ocsinventory-agent || die
	insinto /etc/default
	doins etc/default/ocsinventory-agent || die
	insinto /etc/init.d
	insopts -m0644
	doins etc/init.d/ocsinventory-agent || die
	keepdir /var/{lib,log}/${PN} || die
	if use logrotate ; then
		insinto /etc/logrotate.d
		doins etc/logrotate.d/ocsinventory-agent
	fi

}



