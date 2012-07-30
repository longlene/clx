# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Graphical management tool for Xen virtualization platform."
HOMEPAGE="http://xenman.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE="remote"

RDEPEND=">=dev-lang/python-2.4
		>=dev-python/pygtk-2.10
		>=app-emulation/xen-3.0.2
		>=app-emulation/xen-tools-3.0.2
		>=dev-python/paramiko-1.6.1
		>=x11-libs/vte-0.14
		remote? ( >=net-misc/openssh-4.3 )"

pkg_setup() {
	if ! built_with_use x11-libs/vte python; then
		eerror "x11-libs/vte has to be built with python support."
		die "Missing python USE-flag for x11-libs/vte"
	fi
}


src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-gentoo.patch"
}

pkg_preinst() {
	dodir /var/cache/${PN}
	./mk_image_store || die "make image store failed"
}

src_install() {	
	newsbin XenMan xenman

	dodir /usr/share/${PN}
	insinto /usr/share/${PN}
	doins -r pixmaps/ src/ xenman.glade
	
	dodoc doc/README* doc/*.txt
	dohtml doc/*.html
}
