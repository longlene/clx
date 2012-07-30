# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-servers/monkeyd/monkeyd-0.9.2-r1.ebuild,v 1.2 2009/04/20 08:09:58 bangert Exp $

EAPI="2"

inherit toolchain-funcs eutils depend.php

WEBROOT=/var/www/localhost

DESCRIPTION="A Fast and Lightweight Web Server for Linux"
HOMEPAGE="http://monkey-project.com"
SRC_URI="http://monkey-project.com/releases/${PV:0:4}/monkey-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~mips ~ppc ~sparc ~x86"
IUSE="php"

RDEPEND="php? ( dev-lang/php )"

S="${WORKDIR}/monkey-${PV}"

pkg_setup() {
	use php && require_php_cgi
}

src_prepare() {
	epatch "${FILESDIR}/monkeyd-0.11.1-fix-ldflags.diff"
}

src_configure() {
	# monkey has it's own funky script ... cant use econf
	./configure \
		--prefix=/usr \
		--bindir=/usr/bin \
		--sysconfdir=/etc/${PN} \
		--datadir=${WEBROOT}/htdocs \
		--logdir=/var/log/${PN} \
		--plugdir=/usr/lib/${PN} \
		|| die
}

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" || die "emake failed"
}

src_install() {
	make \
		PREFIX="${D}"/usr \
		BINDIR="${D}"/usr/bin \
		CGIBIN="${D}"${WEBROOT}/cgi-bin \
		SYSCONFDIR="${D}"/etc/${PN} \
		DATADIR="${D}"${WEBROOT}/htdocs \
		LOGDIR="${D}"/var/log/${PN} \
		install \
		|| die "make install failed"

	mv "${D}"${WEBROOT}/htdocs/{index,index-monkey}.html

	dosed "s:/var/log/monkeyd/monkey.pid:/var/run/monkey.pid:" /etc/monkeyd/monkey.conf
	newinitd "${FILESDIR}"/monkeyd.init.d monkeyd
	newconfd "${FILESDIR}"/monkeyd.conf.d monkeyd
	dodoc README MODULES *.txt
}
