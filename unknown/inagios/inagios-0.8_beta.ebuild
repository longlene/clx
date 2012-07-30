# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils webapp 

DESCRIPTION="WebApp Nagios for Iphone"
HOMEPAGE="http://inagios.com/"
SRC_URI="https://inagios.com/inagios-beta-20080318.tar.gz"
RESTRICT="fetch"

LICENSE="Apache License-2"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"
IUSE="nagios apache"
MY_HTDOCSDIR="/var/www/localhost/htdocs"

Version="-beta-20080318"
MY_P=${PN}${Version}
S="${WORKDIR}"

RDEPEND="
		dev-perl/libwww-perl
		dev-perl/Time-Duration
		dev-perl/Apache-DBI
		dev-perl/XML-Simple
		dev-perl/HTML-Mason
		www-apache/libapreq2
		dev-perl/Class-DBI-mysql
		www-apache/mod_perl
    	nagios? ( net-analyzer/nagios dev-db/mysql net-analyzer/ndoutils  )
		apache? ( www-servers/apache )"

pkg_nofetch() {
	einfo "Please download"
	einfo "  - ${MY_P}.tar.gz"
	einfo "from ${HOMEPAGE} and place them in ${DISTDIR}"
}

pkg_setup() {
	webapp_pkg_setup

	if use nagios ; then
		elog "You have to configure nagios to store its data in a mysql database."
		elog "Please read http://nagios.sourceforge.net/docs/ndoutils/NDOUtils.pdf"
	fi
}

src_install() {
	webapp_src_preinst
	
	newdoc etc/httpd/conf.d/inagios.com.conf inagios.com.conf
	rm -rf ${S}/etc
	mv var/www/html/inagios.com/* .
	rm -rf ${S}/var

	insinto "${MY_HTDOCSDIR}"
	doins -r . 

#	webapp_postinst_txt "${FILESDIR}/postinstall.txt"
	webapp_src_install
}

pkg_postinst() {
	
	ewarn "In order to complete the installation you have to"
	ewarn "edit the following files you just installed accordingly."
	ewarn " "
	ewarn "iNagiosWebApp.pm line 42,43 and 44"
	ewarn "login.js line 27"
	ewarn "trimCacheDB.pl line 25"
	ewarn " "
	ewarn "And there is of course apache. Check out the sample"
	ewarn "config file in /usr/share/doc/inagios-0.8_beta"

	webapp_pkg_postinst

#	chown -R apache:apache /var/www/localhost/htdocs/inagios
}
