# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# Nonofficial ebuild by jdkbx

inherit eutils distutils

MY_P=${P}
S=${WORKDIR}/${MY_P}

DESCRIPTION="framework for 802.11 (wireless) packet injection"
HOMEPAGE="http://airpwn.sourceforge.net/Airpwn.html"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="net-wireless/lorcon"
RDEPEND=""

src_compile() {
	econf || die "econf failed"
	emake || die "compile failed"
}

src_install() {
	emake DESTDIR=${D} install || die "install failed"
}
