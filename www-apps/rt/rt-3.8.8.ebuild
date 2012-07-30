# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/rt/rt-3.6.7.ebuild,v 1.1 2008/07/01 16:48:46 wrobel Exp $

inherit webapp eutils depend.apache confutils

DESCRIPTION="RT is an enterprise-grade ticketing system"
HOMEPAGE="http://www.bestpractical.com/rt/"
SRC_URI="http://download.bestpractical.com/pub/${PN}/release/${P}.tar.gz"
RESTRICT="mirror"

KEYWORDS="~amd64 ~ppc ~x86"
LICENSE="GPL-2"
IUSE="mysql postgres fastcgi modperl lighttpd"

DEPEND="
	>=dev-lang/perl-5.8.9

	dev-perl/Email-Address
	dev-perl/MIME-Types
	dev-perl/PerlIO-eol
	dev-perl/GnuPG-Interface
	dev-perl/net-server
	>=dev-perl/HTTP-Server-Simple-0.34
	dev-perl/File-ShareDir
	dev-perl/Data-ICal
	>=dev-perl/HTML-RewriteAttributes-0.02

	>=dev-perl/Apache-Session-1.53
	dev-perl/Cache-Simple-TimedExpiry
	dev-perl/Calendar-Simple
	>=dev-perl/class-returnvalue-0.40
	>=dev-perl/CSS-Squish-0.06
	>=dev-perl/DBI-1.37
	>=dev-perl/dbix-searchbuilder-1.54
	>=dev-perl/Devel-StackTrace-1.19
	dev-perl/GD
	dev-perl/GDGraph
	dev-perl/GDTextUtil
	dev-perl/GraphViz
	dev-perl/Module-Refresh
	dev-perl/HTML-Format
	>dev-perl/HTML-Mason-1.36
	dev-perl/HTML-Parser
	>=dev-perl/HTML-Scrubber-0.08
	dev-perl/HTML-Tree
	>=dev-perl/HTTP-Server-Simple-Mason-0.09
	dev-perl/libwww-perl
	dev-perl/locale-maketext-fuzzy
	>=dev-perl/locale-maketext-lexicon-0.32
	>=dev-perl/log-dispatch-2.0
	>=dev-perl/MailTools-1.57
	>=dev-perl/MIME-tools-5.425
	>=dev-perl/Module-Versions-Report-1.05
	dev-perl/regexp-common
	dev-perl/TermReadKey
	dev-perl/text-autoformat
	>=dev-perl/Text-Quoted-2.02
	>=dev-perl/text-template-1.44
	>=dev-perl/Text-WikiFormat-0.76
	dev-perl/text-wrapper
	dev-perl/TimeDate
	dev-perl/Time-modules
	>=dev-perl/Tree-Simple-1.04
	dev-perl/UNIVERSAL-require
	>=dev-perl/XML-RSS-1.05
	>=virtual/perl-CGI-3.38
	virtual/perl-digest-base
	>=virtual/perl-Digest-MD5-2.27
	>=virtual/perl-File-Spec-0.8
	virtual/perl-File-Temp
	>=virtual/perl-Getopt-Long-2.24
	virtual/perl-libnet
	>=virtual/perl-locale-maketext-1.06
	virtual/perl-Scalar-List-Utils
	>=virtual/perl-Storable-2.08
	virtual/perl-Time-HiRes

	!lighttpd? ( dev-perl/Apache-DBI )
	lighttpd? ( dev-perl/FCGI )
	fastcgi? ( dev-perl/FCGI )
	mysql? ( >=dev-perl/DBD-mysql-2.1018 )
	postgres? ( >=dev-perl/DBD-Pg-1.43 )
"

RDEPEND="${DEPEND}
	virtual/mta
	!lighttpd? ( ${APACHE2_DEPEND} modperl? ( www-apache/mod_perl ) )
	lighttpd? ( >=www-servers/lighttpd-1.3.13 )
"

need_httpd_cgi

add_user_rt() {
	# add new user
	# suexec2 requires uid >= 1000; enewuser is of no help here
	# From: Mike Frysinger <vapier@gentoo.org>
	# Date: Fri, 17 Jun 2005 08:41:44 -0400
	# i'd pick a 5 digit # if i were you

	local euser="rt"

	# first check if username rt exists
	if [[ ${euser} == $(egetent passwd "${euser}" | cut -d: -f1) ]] ; then
		# check uid
		rt_uid=$(egetent passwd "${euser}" | cut -d: -f3)
		if $(expr ${rt_uid} '<' 1000 > /dev/null); then
			ewarn "uid of user rt is less than 1000. suexec2 will not work."
			ewarn "If you want to use FastCGI, please delete the user 'rt'"
			ewarn "from your system and re-emerge www-apps/rt"
			epause
		fi
		return 0 # all is well
	fi

	# add user
	# stolen from enewuser
	local pwrange euid

	pwrange=$(seq 10001 11001)
	for euid in ${pwrange} ; do
		[[ -z $(egetent passwd ${euid}) ]] && break
	done
	if [[ ${euid} == "11001" ]]; then
		# she gets around, doesn't she?
		die "No available uid's found"
	fi

	elog " - Userid: ${euid}"

	enewuser rt ${euid} -1 /dev/null rt > /dev/null
	return 0
}

pkg_setup() {
	webapp_pkg_setup
	ewarn
	ewarn "If you are upgrading from an existing _RT2_ installation,"
	ewarn "stop this ebuild (Ctrl-C now), download the upgrade tool,"
	ewarn "http://bestpractical.com/pub/rt/devel/rt2-to-rt3.tar.gz"
	ewarn "and follow the included instructions."
	ewarn
	epause 5
	enewgroup rt >/dev/null
	add_user_rt || die "Could not add user"
}

src_unpack() {
	unpack ${A}
	cd "${S}"

	# add Gentoo-specific layout
	cat "${FILESDIR}"/config.layout-gentoo >> config.layout
	sed -e "s|PREFIX|${D}/${MY_HOSTROOTDIR}/${PF}|
			s|HTMLDIR|${D}/${MY_HTDOCSDIR}|g" -i ./config.layout || die

	# don't need to check dev dependencies
	sed -e "s|\$args{'with-DEV'} =1;|#\$args{'with-DEV'} =1;|" -i sbin/rt-test-dependencies.in || die
}

src_compile() {
	local web="apache"
	use lighttpd && web="lighttpd"

	local webhandler='modperl2'
	use fastcgi && webhandler='fastcgi'

	local dbtype dba

	if use mysql; then
		dbtype="--with-db-type=mysql"
		dba="--with-db-dba=root"
	fi
	if use postgres;then
		dbtype="--with-db-type=Pg"
		dba="--with-db-dba=postgres"
	fi
	if use postgres && use mysql; then
		ewarn "Both mysql and postgres USE flags enabled, default is mysql."
		ewarn "You can set the default value in RT_SiteConfig before DB init."
		dbtype="--with-db-type=mysql"
		dba="--with-db-dba=root"
	fi

	./configure --enable-layout=Gentoo \
		--with-bin-owner=rt \
		--with-libs-owner=rt \
		--with-libs-group=rt \
		--with-rt-group=rt \
		--with-web-user=${web} \
		--with-web-group=${web} \
		--with-web-handler=${webhandler} \
		${dbtype} ${dba}

	# check for missing deps and ask to report if something is broken
	local myconf="--verbose \
		$(enable_extension_withonly mysql mysql) \
		$(enable_extension_withonly postgresql postgres) \
		$(enable_extension_withonly fastcgi fastcgi) \
		$(enable_extension_withonly fastcgi lighttpd)" \

	if ! useq fastcgi && ! useq lighttpd; then
		myconf="${myconf} --with-modperl2"
	fi

	/usr/bin/perl ./sbin/rt-test-dependencies ${myconf} > "${T}"/t
	if grep -q "MISSING" "${T}"/t; then
		ewarn "Missing Perl dependency!"
		ewarn
		cat "${T}"/t | grep MISSING
		ewarn
		ewarn "Please run perl-cleaner. If the problem persists,"
		ewarn "please file a bug in the Gentoo Bugzilla with the information above"
		die "Missing dependencies."
	fi
}

src_install() {
	webapp_src_preinst
	emake install || die "Cannot install"

	# make sure we don't clobber existing site configuration
	rm -f "${D}"/${MY_HOSTROOTDIR}/${PF}/etc/RT_SiteConfig.pm

	# fix paths
	find "${D}" -type f -print0 | xargs -0 sed -i -e "s:${D}::g"

	# copy upgrade files
	insinto "${MY_HOSTROOTDIR}/${PF}"
	doins -r etc/upgrade

	if use lighttpd; then
		newinitd "${FILESDIR}"/${PN}.init.d ${PN}
		newconfd "${FILESDIR}"/${PN}.conf.d ${PN}
		dosed "s/@@PF@@/${PF}/g" /etc/conf.d/${PN}
	else
		doins "${FILESDIR}"/{rt_apache2_fcgi.conf,rt_apache2.conf}
	fi

	webapp_serverowned "${MY_HOSTROOTDIR}"/${PF}/var

	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt
	webapp_hook_script "${FILESDIR}"/reconfig

	webapp_src_install
}
