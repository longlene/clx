# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_P="${P/d/D}"
MY_P="${MY_P/i/I}"
MY_P="${MY_P/-/_}"
DESCRIPTION="Docking library for wxWidgets."
HOMEPAGE="http://wxextended.sourceforge.net"
SRC_URI="mirror://sourceforge/wxextended/${MY_P}.zip"

LICENSE="wxWinLL-3"
KEYWORDS="~x86"
IUSE=""
SLOT="0"

DEPEND="app-arch/unzip
	>=sys-devel/autoconf-2.52
        >=x11-libs/wxGTK-2.4"

S=${WORKDIR}/wxDockit

src_compile() {
	chmod +x configure
        econf || die "econf failed"
        emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "install failed"

	# Add a symlink to correct the missing extension for the library name
	dosym libwxdockit-2.1 /usr/lib/libwxdockit-2.1.so

	dodoc credits.txt installation.txt readme.txt releaseNotes.txt
}
