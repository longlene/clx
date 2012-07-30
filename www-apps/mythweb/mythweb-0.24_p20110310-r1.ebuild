# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/mythweb/mythweb-0.23.1_p25396.ebuild,v 1.1 2010/07/27 03:14:08 cardoe Exp $

EAPI=2

MYTHTV_VERSION=""
MYTHTV_BRANCH="fixes/0.24"
MYTHTV_REV="d0f3ba16ab2de06b5339f11f07d05f2cc21f74b0"
MYTHTV_SREV="d0f3ba1"

inherit webapp depend.php versionator

DESCRIPTION="PHP scripts intended to manage MythTV from a web browser."
IUSE=""
KEYWORDS="amd64 ppc x86"

RDEPEND="dev-lang/php[json,mysql,session,posix]
	|| ( <dev-lang/php-5.3[spl,pcre] >=dev-lang/php-5.3 )
	dev-perl/DBI
	dev-perl/DBD-mysql
	dev-perl/Net-UPnP"

DEPEND="${RDEPEND}
		app-arch/unzip"


# Release version
MY_PV="${PV%_*}"

# what product do we want
case "${PN}" in
	mythtv)
		REPO="mythtv"
		MY_PN="mythtv"
		S="${WORKDIR}/MythTV-${REPO}-${MYTHTV_SREV}/${MY_PN}"
		;;
	mythtv-bindings)
		REPO="mythtv"
		MY_PN="mythtv"
		S="${WORKDIR}/MythTV-${REPO}-${MYTHTV_SREV}/${MY_PN}"
		;;
	mythweb)
		REPO="mythweb"
		MY_PN="mythweb"
		S="${WORKDIR}/MythTV-${REPO}-${MYTHTV_SREV}/"
		;;
    nuvexport)
		REPO="nuvexport"
		MY_PN="nuvexport"
		MYTHTV_REV="$NUVEXPORT_REV"
		S="${WORKDIR}/MythTV-${REPO}-${NUVEXPORT_SREV}/"
		;;
	*)
		REPO="mythtv"
		MY_PN="mythplugins"
		S="${WORKDIR}/MythTV-${REPO}-${MYTHTV_SREV}/${MY_PN}"
		;;
esac

# _pre is from SVN trunk while _p and _beta are from SVN ${MY_PV}-fixes
# TODO: probably ought to do something smart if the regex doesn't match anything
[[ "${PV}" =~ (_alpha|_beta|_pre|_rc|_p)([0-9]+) ]] || {
	# assume a tagged release
	MYTHTV_REV="v${PV}"
}

HOMEPAGE="http://www.mythtv.org"
LICENSE="GPL-2"
SRC_URI="https://github.com/MythTV/${REPO}/tarball/${MYTHTV_REV} -> ${REPO}-${PV}.tar.gz"


need_httpd_cgi
need_php5_httpd

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	webapp_src_preinst

	cd "${S}"
	dodoc README INSTALL

	dodir "${MY_HTDOCSDIR}"/data

	insinto "${MY_HTDOCSDIR}"
	doins -r [[:lower:]]*

	webapp_configfile "${MY_HTDOCSDIR}"/mythweb.conf.{apache,lighttpd}

	webapp_serverowned "${MY_HTDOCSDIR}"/data

	webapp_postinst_txt en "${FILESDIR}"/0.24-postinstall-en.txt

	webapp_src_install

	fperms 755 /usr/share/webapps/mythweb/${PV}/htdocs/mythweb.pl
}
