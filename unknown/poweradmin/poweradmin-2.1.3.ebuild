# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit webapp

DESCRIPTION="A friendly web-based DNS administration tool for PowerDNS"
HOMEPAGE="https://www.poweradmin.org"
SRC_URI="https://www.poweradmin.org/download/${P}.tgz"

LICENSE="GPL-3"
KEYWORDS="~x86 ~amd64"
IUSE="+mysql postgres"

DEPEND=""
RDEPEND="virtual/php
	dev-php/PEAR-MDB2
	mysql? ( dev-php/PEAR-MDB2_Driver_mysql )
	postgres? ( dev-php/PEAR-MDB2_Driver_pgsql )
	sys-devel/gettext"

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt

	webapp_src_install
}
