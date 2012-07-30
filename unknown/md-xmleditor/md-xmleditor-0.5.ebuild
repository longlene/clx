# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
inherit mono

DESCRIPTION="An XML editor plugin for monodevelop."
HOMEPAGE="http://md-xed.sourceforge.net/"
SRC_URI="mirror://sourceforge/md-xed/${P}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=">=dev-util/monodevelop-0.15"
RDEPEND="${DEPEND}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall || die "einstall failed"
}
