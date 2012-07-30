# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
inherit eutils

DESCRIPTION="Terraform is an open source interactive height field generation and manipulation program"
HOMEPAGE="http://terraform.sourceforge.net/"
SRC_URI="http://heanet.dl.sourceforge.net/sourceforge/terraform/${P}.tar.gz"
IUSE=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="=x11-libs/gtk+-1.2*
	>=gnome-base/gnome-core-1.4*
	dev-libs/libxml
	gnome-print
	"
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/desktop-links.patch
}

src_install() {
	make install DESTDIR=${D} \
	|| die "install failed!"

	make_desktop_entry \
		terraform \
		Terrafrom \
		terraform/terraform_logo.xpm \
		3DGraphics \
	|| einfo "Error: make_desktop_entry failed" 
}

