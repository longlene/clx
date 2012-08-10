# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"

inherit eutils

DESCRIPTION="Web based AJAX terminal emulator"
HOMEPAGE="http://code.google.com/p/shellinabox"
SRC_URI="http://shellinabox.googlecode.com/files/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2.0"
KEYWORDS="~x86 ~amd64"

IUSE="+ssl"

RDEPEND="ssl? ( >=dev-libs/openssl-0.9.8 )"
DEPEND="${RDEPEND}"

pkg_setup()
{
    enewgroup ${PN}
    enewuser ${PN} -1 -1 -1 "${PN}"
}

src_configure()
{
	econf \
		$(use_enable ssl) \
		|| die "econf failed"
}

src_install()
{
	emake DESTDIR="${D}" install || die "einstall failed"

    dodir "/var/lib/${PN}"
    fowners ${PN}:${PN} "/var/lib/${PN}"

    newinitd "${FILESDIR}"/${PN}-init ${PN}
	newconfd "${FILESDIR}"/${PN}-conf ${PN}
}

