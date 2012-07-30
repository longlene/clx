# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

WEBAPP_MANUAL_SLOT="yes"
inherit webapp php-lib-r1

DESCRIPTION="Permission system for web based applications."
HOMEPAGE="http://phpgacl.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"
IUSE="${IUSE} doc linguas_ru"


need_php_by_category
RDEPEND="${RDEPEND} >=dev-php/adodb-4.90
	>=dev-php/smarty-2.6.14"

MY_CONF="gacl.ini.php"
MY_ROOT="${ROOT%/}"
MY_PHPLIBROOT="${MY_ROOT}/usr/share/php"
MY_PHPLIBDIR="${MY_PHPLIBROOT}/${PHP_LIB_NAME}"

pkg_setup() {
	webapp_pkg_setup
}

src_unpack() {
	unpack ${A}
	cd "${S}" || die 'unpack to ${S} failed'
	rm -rf admin/smarty
	if use doc && ! use linguas_ru; then  
		rm -rf docs/translations/russian
	fi
	#reuse smarty
	sed -i -e "s:smarty_dir.*:smarty_dir = \"${MY_PHPLIBROOT}/smarty\":" \
		${MY_CONF}
	sed -i -e "s:smarty_template_dir.*:smarty_template_dir = \"${MY_PHPLIBDIR}/admin/templates\":" \
		${MY_CONF}
	sed -i -e "s:smarty_compile_dir.*:smarty_compile_dir = \"/tmp/phpgacl_templates_c\":" \
		${MY_CONF}
	#reuse adodb
	local my_file="gacl.class.php"
	sed -i -e "s:define('ADODB_DIR'.*:define('ADODB_DIR', '${MY_PHPLIBROOT}/adodb');:" \
		${my_file}
	#make multiple installations possible
	local my_file="admin/gacl_admin.inc.php"
	sed -i -e "s:#\(.*\$config_file = '.*\):\1:" ${my_file}
	sed -i -e "s:\(.*\$config_file = dirname.*\):#\1:" ${my_file}
}

src_install() {
	php-lib-r1_src_install . *.php *.ini *.inc *.xml \
		`find admin/ -type f` \
		`find soap/ -type f` \
		`find test_suite/ -type f` \
		`find Cache_Lite/ -type f` \
		|| die 'php-lib-r1_src_install failed'

	webapp_src_preinst
	insinto ${MY_HTDOCSDIR} || die "Unable to insinto ${MY_HTDOCSDIR}"
	doins ${MY_CONF}
	local my_libdir="${MY_ROOT}${PHP_LIB_DIR}"
	ln -s ${my_libdir}/admin ${D}/${MY_HTDOCSDIR}/admin
	ln -s ${my_libdir}/setup.php ${D}/${MY_HTDOCSDIR}/setup.php
	ln -s ${my_libdir}/schema.xml ${D}/${MY_HTDOCSDIR}/schema.xml
	webapp_configfile "${MY_HTDOCSDIR}/${MY_CONF}"
	webapp_src_install

	dodoc AUTHORS CHANGELOG COPYING.lib CREDITS FAQ README TODO
	use doc && dohtml -r docs/* \
		&& insinto /usr/share/doc/${PF} \
		&& doins `find docs/ -name *.odt -o -name *.pdf` \
		&& dodoc `find docs/ -name *.txt -print`
}

pkg_postinst() {
	webapp_pkg_postinst
	echo
	einfo "phpGACL lib files have been installed under ${MY_PHPLIBDIR}."
	if use vhosts; then
		einfo "phpGACL interface files can be installed as described above."
		einfo "For initial setup:"
		einfo "1. Edit ${MY_CONF} from vhost installation dir to match your settings."
		einfo "2. Open setup.php from vhost installation dir in your browser."
	else
		local my_dir="${MY_ROOT}${VHOST_ROOT}/${MY_HTDOCSBASE}/${PHP_LIB_NAME}"
		einfo "phpGACL interface files are installed under ${my_dir}"
		einfo "For initial setup:"
		einfo "1. Edit ${my_dir}/${MY_CONF} to match your settings."
		einfo "2. Open ${my_dir}/setup.php in your browser."
	fi
	echo
	einfo "To use the library in your scripts:"
	einfo "1. Make sure ${MY_CONF} is in your current project directory"
	einfo "   (./) and matches your settings."
	einfo "2. Add '${MY_PHPLIBDIR}' to your include path."
	echo
	einfo "To use the admin interface locally:"
	einfo "1. Symlink ${MY_PHPLIBDIR}/admin to the directory of your"
	einfo "   choice. Make sure ${MY_CONF} is found in the parent (../)."
	einfo "2. Simply open the chosen directory in a browser."
	echo
}
