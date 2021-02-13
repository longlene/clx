# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools flag-o-matic toolchain-funcs user


DESCRIPTION="tiny/turbo/throttling HTTP server"
HOMEPAGE="http://www.acme.com/software/thttpd/"
SRC_URI="http://www.acme.com/software/thttpd/${P}.tar.gz"

LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

RDEPEND=""
DEPEND=""

WEBROOT="/var/www/localhost"

THTTPD_USER=thttpd
THTTPD_GROUP=thttpd
THTTPD_DOCROOT="${EPREFIX}${WEBROOT}/htdocs"

DOCS=( TODO )

pkg_setup() {
	ebegin "Creating thttpd user and group"
	enewgroup ${THTTPD_GROUP}
	enewuser ${THTTPD_USER} -1 -1 -1 ${THTTPD_GROUP}
}

src_prepare() {
	#eapply "${FILESDIR}"/thttpd-renamed-htpasswd.patch
	#mv "${S}"/extras/{htpasswd.c,th_htpasswd.c} || die
	eapply_user
	eautoreconf -f -i
}

src_configure() {
	econf WEBDIR=${THTTPD_DOCROOT}
}

src_install() {
	default

	newinitd "${FILESDIR}"/thttpd.init.1 thttpd
	newconfd "${FILESDIR}"/thttpd.confd.1 thttpd

	insinto /etc/logrotate.d
	newins "${FILESDIR}/thttpd.logrotate" thttpd

	insinto /etc/thttpd
	doins "${FILESDIR}"/thttpd.conf.sample

	#move htdocs to docdir, bug #429632
	docompress -x /usr/share/doc/"${PF}"/htdocs.dist
	mv "${ED}"${WEBROOT}/htdocs \
		"${ED}"/usr/share/doc/"${PF}"/htdocs.dist || die
	mkdir "${ED}"${WEBROOT}/htdocs || die

	keepdir ${WEBROOT}/htdocs

	chown root:${THTTPD_GROUP} "${ED}/usr/sbin/makeweb" \
		|| die "Failed chown makeweb"
	chmod 2751 "${ED}/usr/sbin/makeweb" \
		|| die "Failed chmod makeweb"
	chmod 755 "${ED}/usr/share/doc/${PF}/htdocs.dist/cgi-bin/printenv" \
		|| die "Failed chmod printenv"
}
