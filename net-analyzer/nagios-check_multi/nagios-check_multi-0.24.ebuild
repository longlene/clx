# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A multi purpose wrapper plugin for Nagios."
HOMEPAGE="http://my-plugin.de/wiki/projects/check_multi/start"

SRC_URI="http://my-plugin.de/check_multi/check_multi-stable-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE="nrpe"
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-lang/perl-5.12.2-r4"
RDEPEND="${DEPEND}
		>=net-analyzer/nagios-plugins-1.4.14-r2
		nrpe? ( >=net-analyzer/nagios-nrpe-2.12-r103 )"


S="${WORKDIR}"/check_multi-${PV}

src_compile() {
	econf \
		--libexecdir=/usr/$(get_libdir)/nagios/plugins \
		--sysconfdir=/etc/nagios \
		--with-nagios-group=nagios 

	emake all || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install install-config || die "emake install failed"
}

pkg_postinst() {
	elog "Check /etc/nagios/check_multi for config examples."
}
