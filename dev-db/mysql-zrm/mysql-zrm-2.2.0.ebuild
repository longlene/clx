# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit multilib

MY_P="MySQL-zrm-${PV}"

DESCRIPTION="Zmanda MySQL backup/recovery tool"
HOMEPAGE="http://mysqlbackup.zmanda.com/"
SRC_URI="http://www.zmanda.com/downloads/community/ZRM-MySQL/${PV:0:3}/Source/${MY_P}-release.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
S="${WORKDIR}"

RDEPEND="dev-lang/perl
	dev-perl/DBI
	dev-perl/DBD-mysql
	dev-perl/XML-Parser
	dev-perl/XML-RSS"

src_prepare() {
	rm usr/share/doc/${MY_P}/COPYING
	rm -rf usr/lib/mysql-zrm/XML
	if [ "$(get_libdir)" = "lib64" ] ; then
		grep -l -r /usr/lib/mysql-zrm * | \
		xargs sed -i -e 's:usr/lib/mysql-zrm:usr/lib64/mysql-zrm:g'
	fi
	sed -i -e 's:disable.*=.*no:disable\t\t= yes:g' \
		etc/xinetd.d/mysql-zrm-socket-server
}

src_install() {
	doman usr/share/man/man{1,5}/*
	dodoc usr/share/doc/${MY_P}/*
	dobin usr/bin/*

	insinto /usr/$(get_libdir)/mysql-zrm
	doins -r usr/lib/mysql-zrm/*
	insinto /usr/share/mysql-zrm/plugins
	doins -r usr/share/mysql-zrm/plugins/*

	insinto /etc/logrotate.d
	doins etc/logrotate.d/mysql-zrm
	insinto /etc/xinetd.d
	doins etc/xinetd.d/*
	insinto /etc/mysql-zrm
	insopts -m 700
	doins -r etc/mysql-zrm/*

	insinto /usr/share/mysql-zrm
	insopts -m 700
	doins -r usr/share/mysql-zrm/*

	keepdir /var/{log,lib}/mysql-zrm
}
