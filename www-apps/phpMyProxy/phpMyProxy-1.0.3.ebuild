# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp depend.php 

DESCRIPTION="phpMyProxy is a web-based proxy script in PHP"
HOMEPAGE="http://www.phpmyproxy.com/"
# Upstream hosts source files as an attachment in a _password protected forum_
SRC_URI="http://omploader.org/vejZx/${P/-/_}.zip"

LICENSE="GPL-3"
KEYWORDS="~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S=${WORKDIR}/${P/-/_}

need_php_httpd
need_httpd_cgi 

pkg_setup() {
	webapp_pkg_setup
	require_php_with_use curl
}

src_install() {
	webapp_src_preinst

	dodoc README.txt TODO.txt CHANGELOG.txt || die "Cannot copy documentation"
	rm -f README.txt TODO.txt CHANGELOG.txt UPGRADE.txt \
		|| die "Cannot delete copied documentattion"

	insinto "${MY_HTDOCSDIR}"
	doins -r .  || die "Cannot copy program files"
	keepdir "${MY_HTDOCSDIR}"/cookies || die "Cannot create cookies directory"

	webapp_serverowned "${MY_HTDOCSDIR}"/cookies
	webapp_serverowned "${MY_HTDOCSDIR}"/curl_log.txt

	webapp_configfile "${MY_HTDOCSDIR}"/proxy.config.php

	#webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt
	#webapp_postupgrade_txt en "${FILESDIR}"/postupgrade-en.txt

	webapp_src_install
}
