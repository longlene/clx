# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/sguil-client/sguil-client-0.6.1.ebuild,v 1.5 2009/03/08 02:54:25 cla Exp $

EAPI="2"

inherit eutils

MY_PV="${PV/_p/p}"
DESCRIPTION="GUI Console for sguil Network Security Monitoring"
HOMEPAGE="http://sguil.sf.net"
SRC_URI="mirror://sourceforge/sguil/sguil-client-${MY_PV}.tar.gz"
LICENSE="QPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ssl"

DEPEND=""
RDEPEND="
	>=dev-lang/tcl-8.3[-threads]
	>=dev-lang/tk-8.3
	>=dev-tcltk/itcl-3.2
	>=dev-tcltk/tclx-8.3
	dev-tcltk/itk
	dev-tcltk/iwidgets
	>dev-tcltk/tcllib-1.6.1
	ssl? ( >=dev-tcltk/tls-1.4.1 )
	net-analyzer/wireshark"

S="${WORKDIR}/sguil-${MY_PV}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i -e "/^set SGUILLIB /s:./lib:/usr/$(get_libdir)/sguil:" \
		-e '/^set ETHEREAL_PATH /s:/usr/sbin/ethereal:/usr/bin/wireshark:' \
		-e '/^set SERVERHOST /s:demo.sguil.net:localhost:' \
		-e '/^set MAILSERVER /s:mail.example.com:localhost:' \
		-e '/^set GPG_PATH /s:/usr/local/bin/gpg:/usr/bin/gpg:' \
		client/sguil.conf || die "sed failed"
#	sed -i -e 's:^exec wish:exec wishx': \
#		client/sguil.tk || die "sed failed"
}

src_install() {
	dobin client/sguil.tk
	insinto /etc/sguil
	doins client/sguil.conf
	insinto "/usr/$(get_libdir)/sguil"
	doins "${S}"/client/lib/*
	insinto "/usr/$(get_libdir)/sguil/tablelist4.1"
	doins "${S}"/client/lib/tablelist4.1/*
	insinto "/usr/$(get_libdir)/sguil/tablelist4.1/images"
	doins "${S}"/client/lib/tablelist4.1/images/*
	insinto "/usr/$(get_libdir)/sguil/tablelist4.1/scripts"
	doins "${S}"/client/lib/tablelist4.1/scripts/*
	dodoc doc/*
}

pkg_postinst() {
	elog
	elog "You can customize your configuration by modifying /etc/sguil/sguil.conf"
	elog
}
