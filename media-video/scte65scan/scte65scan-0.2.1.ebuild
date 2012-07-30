# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-tv/mythtv/mythtv-0.23_alpha22857.ebuild,v 1.4 2010/03/23 03:43:52 vapier Exp $

inherit eutils

DESCRIPTION="scte65scan is a QAM frequency scanner for DVB devices"
HOMEPAGE="http://scte65scan.sourceforge.net/"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

SRC_URI="http://downloads.sourceforge.net/project/${PN}/${PN}/${PV}/${P}.tgz"
RESTRICT="nomirror"

IUSE=""
RDEPEND=""
DEPEND=""

src_install() {
	cd "${S}"
	exeinto /usr/bin
	doexe scte65scan
}
