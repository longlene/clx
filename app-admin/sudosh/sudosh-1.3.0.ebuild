# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Allows the execution of a root shell with logging"

HOMEPAGE="http://sourceforge.net/projects/sudosh"

SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="OpenSoftware"

SLOT="0"

KEYWORDS="~x86"

IUSE=""

DEPEND=""
#RDEPEND=""

S=${WORKDIR}/${P}

src_compile() {
	econf || die
	emake || die "emake failed"
}

src_install() {
	einstall || die
	dodoc README INSTALL ChangeLog AUTHORS NEWS COPYING
}
