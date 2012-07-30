# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A collection of tools for executing commands on cluster nodes"
HOMEPAGE="http://clusterit.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE="X"

DEPEND="X? ( x11-libs/libX11 )"
RDEPEND="${DEPEND}
	!app-shells/dsh"

src_unpack() {
	unpack ${A}
	use X || sed -i '/^SUBDIRS =/ { s/dvt//; s/rvt// }' "${S}/Makefile.in"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc README CHANGES
}
