# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

##
# based on ebuild from bug #284536, depending on dev-php/PEAR-XML_Feed_Parser from #258604
##

EAPI="2"

inherit eutils versionator webapp depend.php

MY_PN=eGroupware
MY_PV=$(get_version_component_range 1-3)
MY_P=$(get_version_component_range 4-)
#MY_P="${MY_P/p/}"

DESCRIPTION="Web-based GroupWare suite"
HOMEPAGE="http://www.egroupware.org/"
SRC_URI="mirror://sourceforge/${PN}/${MY_PN}-${MY_PV}.${MY_P}.tar.bz2
	mirror://sourceforge/${PN}/${MY_PN}-egw-pear-${MY_PV}.${MY_P}.tar.bz2
	phpfreechat? ( mirror://sourceforge/${PN}/${MY_PN}-phpfreechat-${MY_PV}.${MY_P}.tar.bz2 )
	gallery? ( mirror://sourceforge/${PN}/${MY_PN}-gallery-${MY_PV}.${MY_P}.tar.bz2 )"

LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~sparc ~x86"
IUSE="ldap mssql mysql postgres gallery phpfreechat jpgraph"

#hint: sqlite needed for calendar
RDEPEND="
	dev-lang/php[ctype,imap,ldap?,mssql?,mysql?,pdo,postgres?,session,sqlite3,unicode]
	|| (
		dev-lang/php[gd]
		dev-lang/php[gd-external]
	)
	dev-php/PEAR-Auth_SASL
	dev-php/PEAR-PEAR
	dev-php/PEAR-XML_Feed_Parser
	virtual/cron
   jpgraph? ( dev-php/jpgraph )
"
#	>dev-php5/jpgraph-1.13


need_httpd_cgi
need_php_httpd

S=${WORKDIR}/${PN}

src_prepare() {
	esvn_clean

   if use jpgraph; then
   	einfo "Fixing jpgraph location"
   	MY_JPGRAPH_VERSION="$(best_version dev-php5/jpgraph)"
   	MY_JPGRAPH_VERSION="${MY_JPGRAPH_VERSION/'dev-php5/jpgraph-'/}"
   	sed -i "s|EGW_SERVER_ROOT . '/../jpgraph/src/jpgraph.php'|'/usr/share/php5/jpgraph/jpgraph.php'|" \
   		projectmanager/inc/class.projectmanager_ganttchart.inc.php || die
   	sed -i "s|EGW_SERVER_ROOT . '/../jpgraph/src/jpgraph_gantt.php'|'/usr/share/php5/jpgraph/jpgraph_gantt.php'|" \
   		projectmanager/inc/class.projectmanager_ganttchart.inc.php || die
   	sed -i "s|$jpgraph_path .= SEP.'jpgraph';|$jpgraph_path = dirname('/usr/share/php5/jpgraph/jpgraph.php');|" \
   		setup/check_install.php || die
   	sed -i "s|'unknown';|'${MY_JPGRAPH_VERSION}';\n         \$available = version_compare(\$version,\$min_version,'>=');|" \
   		setup/check_install.php || die
   fi
}

src_install() {
	webapp_src_preinst
	insinto "${MY_HTDOCSDIR}"
	doins -r .
	webapp_serverowned "${MY_HTDOCSDIR}/phpgwapi/images"
	webapp_postinst_txt en "${FILESDIR}/postinstall-en-1.2.txt"
	webapp_src_install
}

pkg_postinst() {
	if use ldap; then
		elog "If you are using LDAP contacts/addressbook, please read the upgrade instructions at"
		elog "http://www.egroupware.org/index.php?page_name=wiki&wikipage=ManualSetupUpdate"
		elog "before running the egroupware setup"
	fi
	webapp_pkg_postinst
}
