# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic autotools

DESCRIPTION="Tool for monitoring servers, applications and networks."
#HOMEPAGE="http://www.hswn.dk/hobbit/"
HOMEPAGE="http://hobbitmon.sourceforge.net/"
#SRC_URI="http://www.hswn.dk/hobbitsw/${P}.tar.gz"
SRC_URI="mirror://sourceforge/hobbitmon/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="ssl ldap fping"

DEPEND="sys-devel/gcc
		sys-devel/make
		net-www/apache
		dev-libs/libpcre
		net-analyzer/rrdtool
		media-libs/libpng
		ssl? ( dev-libs/openssl )
		ldap? ( net-nds/openldap )
		fping? ( net-analyzer/fping )"

RDEPEND=""

pkg_setup() {
	enewuser hobbit -1 -1 /usr/lib/hobbit adm

}

src_unpack() {
	unpack ${A} || die
	cp ${FILESDIR}/Makefile ${S}
	cd ${S}

	if use ssl ; then
		echo "SSLFLAGS = -DBBGEN_SSL" >> ${S}/Makefile
		echo "SSLINCDIR = -I/usr/include" >> ${S}/Makefile
		echo "SSLLIBS = -L/usr/lib -lssl -lcrypto" >> ${S}/Makefile
		echo "RPATHVAL += /usr/lib" >> ${S}/Makefile
	fi

	if use ldap ; then
		echo "LDAPFLAGS = -DBBGEN_LDAP -DBBGEN_LDAP_USESTARTTLS" >> ${S}/Makefile
		echo "LDAPINCDIR = -I/usr/include" >> ${S}/Makefile
		echo "LDAPLIBS = -L/usr/lib -lldap -llber" >> ${S}/Makefile
		echo "RPATHVAL += /usr/lib" >> ${S}/Makefile
	fi

	if use fping ; then
		echo "FPING = `which fping`" >> ${S}/Makefile; else
		echo "FPING = hobbitping" >>${S}/Makefile
	fi

	echo "BBHOSTNAME = `hostname -f`" >> ${S}/Makefile
	echo "BBHOSTIP = `ifconfig eth0 | grep inet | cut -d: -f2 | cut -d" " -f1`" >> ${S}/Makefile

}

src_compile() {
	emake INSTALLROOT=${D} || die
}

src_install() {
	einstall INSTALLROOT=${D} || die
	dodoc Changes README README.CLIENT docs/*.txt
	dohtml docs/*.html

	keepdir /etc/hobbit
	keepdir /var/tmp/hobbit
	keepdir /var/log/hobbit

	fowners root:adm /var/tmp/hobbit
	fperms 770 /var/tmp/hobbit
	fowners root:adm /var/log/hobbit
	fperms 770 /var/log/hobbit

	mv ${D}/usr/lib/hobbit/server/etc/* ${D}/etc/hobbit/

	rmdir ${D}/usr/lib/hobbit/server/etc
	rmdir ${D}/usr/lib/hobbit/server/tmp
	rmdir ${D}/usr/lib/hobbit/logs

	dosym /etc/hobbit /usr/lib/hobbit/server/etc
	dosym /var/tmp/hobbit /usr/lib/hobbit/server/tmp
	dosym /var/log/hobbit /usr/lib/hobbit/logs

	newinitd ${FILESDIR}/hobbit.init hobbit
	insinto /etc/apache2/modules.d
	doins ${FILESDIR}/60_hobbit.conf
}

pkg_preinst() {
	enewuser hobbit -1 -1 /usr/lib/hobbit adm
}

pkg_postinst() {
	einfo
	einfo
	einfo "Hobbit installation successful!"
	einfo
	einfo
	einfo "Please restart the Apache web server:"
	einfo "/etc/init.d/apache2 restart"
	einfo
	einfo "Please add secure user(s) for web-based Hobbit management:"
	einfo "/usr/sbin/htpasswd2 -c /etc/hobbit/hobbitpasswd admin"
	einfo
	einfo "If you are using Fping, you will want to set the SUID bit:"
	einfo "chmod +s /usr/sbin/fping -- ensure your path to fping is correct."
	einfo
	einfo
	einfo "Edit the following in /etc/hobbit/hobbitserver.cfg:"
	einfo "BBSERVERHOSTNAME, BBSERVERIP, and BBSERVERWWWNAME as appropriate"
	einfo
	einfo "Also edit /etc/hobbit/bb-hosts.cfg as appropriate"
	einfo
	einfo
	einfo "Now you may start the Hobbit:"
	einfo "/etc/init.d/hobbit start"
	einfo
	einfo "If you want Hobbit to start automatically on boot:"
	einfo "rc-update add hobbit default"
	einfo
	einfo
	einfo "Wait a few minutes and browse http://localhost/hobbit/"
	einfo "Or replace 'localhost' with actual hostname or IP address"
	einfo
	einfo
	einfo

}
