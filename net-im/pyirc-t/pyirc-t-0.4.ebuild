# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

NEED_PYTHON=2.3

inherit eutils multilib python

DESCRIPTION="Python based jabber transport for IRC"
HOMEPAGE="http://xmpppy.sourceforge.net/irc/"
SRC_URI="mirror://sourceforge/xmpppy/irc-transport-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="net-im/jabber-base"
RDEPEND="${DEPEND}
	>=dev-python/imaging-1.1
	>=dev-python/python-irclib-0.4.6
	>=dev-python/twisted-2.2.0
	>=dev-python/twisted-words-0.1.0
	>=dev-python/twisted-web-0.5.0
	>=dev-python/xmpppy-0.4.1"

src_install() {
	local inspath

	python_version
	inspath=/usr/$(get_libdir)/python${PYVER}/site-packages/${PN}
	insinto ${inspath}
	doins irc-transport-${PV}/*.py

	insinto /etc/jabber
	newins irc-transport-${PV}/config_example.xml ${PN}.xml
	fperms 600 /etc/jabber/${PN}.xml
	fowners jabber:jabber /etc/jabber/${PN}.xml
	dosed \
		"s:<spooldir>[^\<]*</spooldir>:<spooldir>/var/spool/jabber</spooldir>:" \
		/etc/jabber/${PN}.xml
	dosed \
		"s:<pid>[^\<]*</pid>:<pid>/var/run/jabber/${PN}.pid</pid>:" \
		/etc/jabber/${PN}.xml
	dosym /etc/jabber/${PN}.xml /etc/pyirct.conf.xml

	newinitd "${FILESDIR}/${PN}-${PV}-initd" ${PN}
	dosed "s:INSPATH:${inspath}:" /etc/init.d/${PN}
}

pkg_postinst() {
	python_version
	python_mod_optimize "${ROOT}usr/$(get_libdir)/python${PYVER}/site-packages/${PN}"

	elog "A sample configuration file has been installed in /etc/jabber/${PN}.xml."
	elog "Please edit it and the configuration of your Jabber server to match."
}

pkg_postrm() {
	python_version
	python_mod_cleanup "${ROOT}usr/$(get_libdir)/python${PYVER}/site-packages/${PN}"
}
