# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit webapp depend.php

DESCRIPTION="An extremely flexible application to catalogue all sorts of things"
HOMEPAGE="http://opendb.iamvegan.net/"
SRC_URI="mirror://sourceforge/${PN}/OpenDb-${PV}.zip
	linguas_de? ( http://opendb.iamvegan.net/wiki/images/0/05/German-1.5.b5-iso8859-1-standard.zip -> OpenDb-Lang-German-1.5.b5-iso8859-1.zip )
	linguas_sk? ( http://opendb.iamvegan.net/wiki/images/0/08/Slovak_1.5.zip -> OpenDb-Lang-Slovak-1.5.zip )
	themes? ( http://neverdunn.net/opendb/themes/uploads/Shadowland.zip -> OpenDb-Theme-Shadowland-1.5.x.zip
		http://jack-frost.no-ip.info/themes/BlackIce_v1.5+.zip -> OpenDb-Theme-BlackIce-1.5.x.zip
		http://opendb.iamvegan.net/wiki/images/2/23/Joomlike_v01-00.zip -> OpenDb-Theme-Joomlike-1.5.x-v01-00.zip )
	"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86"
IUSE="themes linguas_de linguas_sk"

DEPEND="|| ( <dev-lang/php-5.3[pcre] >=dev-lang/php-5.3 )
	|| ( dev-lang/php[mysql] dev-lang/php[mysqli] )"
RDEPEND=""

S="${WORKDIR}"

need_httpd_cgi
need_php_httpd

pkg_setup() {
	webapp_pkg_setup
}

src_install() {
	webapp_src_preinst

	dodoc docs/ChangeLog docs/LICENSE docs/README
	docinto scripts
	dodoc docs/scripts/*

	# Shadowland Theme
	use themes && mv -f Shadowland theme/Shadowland
	# Black Ice Theme
	use themes && mv -f BlackIce_v1.5+ theme/BlackIce
	# Joomlike Theme
	use themes && mv -f Joomlike_v01-00 theme/Joomlike

	[ -f include/local.config.php ] || cp include/local.config.php.dist include/local.config.php

	insinto "${MY_HTDOCSDIR}"
	doins -r *.php admin functions images include scripts site help import \
	    itemcache lib export importcache install theme httpcache log upload


	echo "order deny,allow" >${D}/${MY_HTDOCSDIR}/log/.htaccess
	echo "deny  from all" >>${D}/${MY_HTDOCSDIR}/log/.htaccess

	echo "order deny,allow" >${D}/${MY_HTDOCSDIR}/importcache/.htaccess
	echo "deny  from all" >>${D}/${MY_HTDOCSDIR}/importcache/.htaccess

	echo "order deny,allow" >${D}/${MY_HTDOCSDIR}/itemcache/.htaccess
	echo "deny  from all" >>${D}/${MY_HTDOCSDIR}/itemcache/.htaccess

	echo "order deny,allow" >${D}/${MY_HTDOCSDIR}/upload/.htaccess
	echo "deny  from all" >>${D}/${MY_HTDOCSDIR}/upload/.htaccess

	webapp_serverowned "${MY_HTDOCSDIR}"/index.php
	webapp_serverowned "${MY_HTDOCSDIR}"

	webapp_configfile  "${MY_HTDOCSDIR}"/include/local.config.php

	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt
##	webapp_postupgrade_txt en "${FILESDIR}"/postupgrade-en.txt

	webapp_src_install
}


