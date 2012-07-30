# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="linux version of echolink"
HOMEPAGE="http://cqinet.sourceforge.net/"
SRC_URI="mirror://sourceforge/cqinet/${P}.tgz"

SLOT="0"
KEYWORDS="x86"
LICENSE="GPL-2"
IUSE="X"

RDEPEND="X? ( x11-libs/xforms )"
DEPEND="${RDEPEND}"

src_compile() {
	if use X ; then 
		cd echogui/
		sed -i -e "s:X11/forms.h:forms.h:" testgui.c || die "sed failed"
		sed -i -e "s:X11/forms.h:forms.h:" testgui_cb.c || die "sed failed"
		sed -i -e "s:X11/forms.h:forms.h:" testgui_main.c || die "sed failed"
		emake || die
	fi
	cd ${S}/echolinux/
	sed -i -e "s:/usr/local/etc/:/usr/share/echolinux/:" echo_copy_defaults || die "sed failed"
	emake || die
}

src_install () {
	dodir /usr/share/echolinux
	cp "${S}/echolinux/info.txt" "${D}/usr/share/${PN}/" || die "cp defaults failed"
	cp "${S}/echolinux/servers.txt" "${D}/usr/share/${PN}/" || die "cp defaults failed"
	cp "${S}/echolinux/userdata.txt" "${D}/usr/share/${PN}/" || die "cp defaults failed"
	cp "${S}/echolinux/connect.wav" "${D}/usr/share/${PN}/" || die "cp defaults failed"
	if use X ; then
		dobin echogui/echogui
	fi
	dobin echolinux/echolinux echolinux/echo_copy_defaults
	dodoc README Using_EchoLinux.txt
}
