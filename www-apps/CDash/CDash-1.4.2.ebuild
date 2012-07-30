# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit webapp

DESCRIPTION="A web-based software testing server"
HOMEPAGE="http://www.cdash.org"
SRC_URI="http://www.cdash.org/download/${P}.zip"

LICENSE="CMake"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/php-5[xsl,curl,gd]
	|| ( >=dev-db/mysql-5
	>=virtual/postgresql-server-8.3 )"
RDEPEND="${DEPEND}"

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	webapp_configfile "${MY_HTDOCSDIR}"/cdash/config.php
	webapp_serverowned "${MY_HTDOCSDIR}"/rss
	webapp_serverowned "${MY_HTDOCSDIR}"/backup
	webapp_src_install
}
