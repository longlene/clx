# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit versionator eutils webapp multilib autotools

DESCRIPTION="A feature-rich open source mailing list software"
HOMEPAGE="http://www.sympa.org/"
SRC_URI="http://www.sympa.org/distribution/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="mysql postgres sqlite apache2 clamav fastcgi ldap nfs soap ssl
dkim"

REQUIRED_USE="fastcgi? ( apache2 )
|| ( mysql postgres sqlite )"

RESTRICT="mirror"

#MY_VER="${PV%.[0-9]}" # Should be expanded to MAJOR.MINOR
MY_VER=$(get_version_component_range 1-2 $PV)

# See http://www.sympa.org/manual/installing-sympa#required_cpan_modules
RDEPEND="
	>=dev-lang/perl-5.8
	>=virtual/perl-CGI-3.35
	>=virtual/perl-DB_File-1.75
	>=virtual/perl-Digest-MD5-2.00
	>=virtual/perl-File-Spec-0.8
	>=virtual/perl-MIME-Base64-3.03
	virtual/perl-libnet
	>=dev-perl/Archive-Zip-1.05
	>=dev-perl/Crypt-CipherSaber-0.90
	>=dev-perl/DBI-1.48
	>=dev-perl/HTML-StripScripts-Parser-1.0.3
	dev-perl/IO-stringy
	>=dev-perl/MIME-Charset-0.04.1
	>=dev-perl/MIME-EncWords-0.040
	>=dev-perl/MIME-tools-5.423
	>=dev-perl/MailTools-1.51
	dev-perl/Template-Toolkit
	dev-perl/XML-LibXML
	dev-perl/libintl-perl
	dev-perl/libwww-perl
	dev-perl/regexp-common
	dev-perl/File-Copy-Recursive
	dev-perl/HTML-Format
	dev-perl/MIME-Lite
	dev-perl/MIME-Lite-HTML
	dev-perl/Term-ProgressBar
	dev-perl/Net-Netmask
	dev-perl/Unicode-LineBreak
	clamav? ( app-antivirus/clamav )
	fastcgi? ( >=dev-perl/FCGI-0.67 apache2? ( www-apache/mod_fcgid ) )
	ldap? ( >=dev-perl/perl-ldap-0.27 )
	mysql? ( >=dev-perl/DBD-mysql-2.0407 )
	>=net-mail/mhonarc-2.6.0
	nfs? ( dev-perl/File-NFSLock )
	postgres? ( >=dev-perl/DBD-Pg-0.90 )
	soap? ( >=dev-perl/SOAP-Lite-0.60 )
	sqlite? ( dev-perl/DBD-SQLite )
	ssl? ( dev-perl/IO-Socket-SSL )
	virtual/mta
	dkim? ( dev-perl/Mail-DKIM )
	"
DEPEND="${RDEPEND}
	sys-devel/gettext
	"

need_httpd

# TODO
# apache2? conf
# DBD-Oracle ??
# DBD-Sybase ??

MY_SYMPAUSER="sympa"
MY_SYMPAGROUP="sympa"

pkg_setup() {
	enewgroup ${MY_SYMPAGROUP}
	enewuser ${MY_SYMPAUSER} -1 -1 -1 ${MY_SYMPAGROUP}

}

src_prepare() {
	eautoreconf
}

src_configure() {

	econf \
		--prefix=/usr \
		--sysconfdir=/etc/sympa \
		--localstatedir=/var \
		--enable-fhs
}

src_compile() {

	emake CFLAGS="${CFLAGS} -Wl,-z,now"
}

src_install() {

	emake DESTDIR="${D}" install

	# Set permissions and ownership on config files
	dodir /etc/sympa
	mv ${D}/etc/sympa.conf ${D}/etc/wwsympa.conf ${D}/etc/sympa/
	mv ${D}/etc/data_structure.version ${D}/etc/sympa/
	fperms 0640 /etc/sympa/sympa.conf /etc/sympa/wwsympa.conf \
		/etc/sympa/data_structure.version
	fowners ${MY_SYMPAUSER}:${MY_SYMPAGROUP} /etc/sympa/sympa.conf \
		/etc/sympa/wwsympa.conf /etc/sympa/data_structure.version

	# Docs
	dodoc AUTHORS ChangeLog INSTALL NEWS README

	# Startup script
	newinitd "${FILESDIR}/${PN}-${MY_VER}.initd" "${PN}"
	rm -rf "${D}/etc/sympa/rc.d"

	# Create pidfile dir
	keepdir /var/run/sympa
	fowners ${MY_SYMPAUSER}:${MY_SYMPAGROUP} /var/run/sympa

	# Set proper fastcgi flag
	if use fastcgi; then
		sed -i -r "s:^(\s*use_fast_cgi\s*).*:\11:" "${D}/etc/sympa/wwsympa.conf"
	else
		sed -i -r "s:^(\s*use_fast_cgi\s*).*:\10:" "${D}/etc/sympa/wwsympa.conf"
	fi
	# Update antivirus config
	if use clamav; then
		sed -i -r \
			-e 's:^#?\s*antivirus_path\s*/.*:antivirus_path /usr/bin/clamscan:' \
			-e 's:^#?\s*antivirus_args\s*.*:antivirus_args --stdout:' \
			"${D}/etc/sympa/sympa.conf"
	else
		sed -i -r \
			-e 's:^(\s*antivirus_path\s*/.*):#\1:' \
			-e 's:^(\s*antivirus_args\s*.*):#\1:' \
			"${D}/etc/sympa/sympa.conf"
	fi
	# Update openssl config
	if use ssl; then
		sed -i -r \
			-e 's:^#?\s*openssl\s*/.*:openssl /usr/bin/openssl:' \
			-e 's:^#?\s*capath\s*/.*:capath /etc/ssl/certs:' \
			-e 's:^#?\s*cafile\s*/.*:cafile /etc/ssl/certs/ca-certificates.crt:' \
			"${D}/etc/sympa/sympa.conf"
	else
		sed -i -r \
			-e 's:^(\s*openssl\s*/.*):#\1:' \
			-e 's:^(\s*capath\s*/.*):#\1:' \
			-e 's:^(\s*cafile\s*/.*):#\1:' \
			"${D}/etc/sympa/sympa.conf"
	fi
	# Queue dirs
	keepdir /var/spool/sympa
	local MY_DIRS="arc auth automatic bounce digest distribute expire \
		moderation msg outgoing qbounce static_content subscribe task tmp topic"
	local MY_DIR
	for MY_DIR in ${MY_DIRS}; do
		keepdir /var/spool/sympa/${MY_DIR}
		fowners ${MY_SYMPAUSER}:${MY_SYMPAGROUP} /var/spool/sympa/${MY_DIR}
		case "${MY_DIR}" in
			"static_content" )
				fperms 755 /var/spool/sympa/${MY_DIR}
			;;
			* )
				fperms 750 /var/spool/sympa/${MY_DIR}
			;;
		esac
	done
	keepdir /var/lib/sympa
	keepdir /var/lib/sympa/lists
	fowners ${MY_SYMPAUSER}:${MY_SYMPAGROUP} /var/lib/sympa/lists

	newdoc "${FILESDIR}/${PN}-${MY_VER}.apache.conf" apache.conf
	newdoc "${FILESDIR}/${PN}-${MY_VER}.apache_soap.conf" apache_soap.conf
	newdoc "${FILESDIR}/${PN}-${MY_VER}.lighttpd.conf" lighttpd.conf
	newdoc "${FILESDIR}/${PN}-${MY_VER}.lighttpd_soap.conf" lighttpd_soap.conf
}

pkg_postinst() {

	elog
	elog "You need to create a database with associated database account"
	elog "prior to use Sympa. That account will need general"
	elog "access privileges to the Sympa database."
	elog
	elog "The Sympa web interface needs to be setup in your webserver."
	elog "For more information please consult Sympa documentation at"
	elog "http://www.sympa.org/manual/web-interface#web_server_setup"
	elog "Sample configs are installed in /usr/share/doc/${P}"
	elog

	if useq clamav; then
		elog "By default we use clamscan antivirus scanner"
		elog "(antivirus_path option in sympa.conf). For performance"
		elog "reason you might want to use clamdscan which is much faster."
		elog "To use it you need to do the following:"
		elog
		elog "# gpasswd -a clamav sympa"
		elog "# /etc/init.d/clamd restart"
		elog
	fi
}
