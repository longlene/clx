# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils
DESCRIPTION="A universal control panel for all Video for Linux Two (V4L2) devices"
HOMEPAGE="http://v4l2ucp.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND="x11-libs/qt:3"
RDEPEND="${DEPEND}"

# src_compile() {
# 	econf || die "econf failed"
# 	emake || die "emake failed"
# }

src_install() {
	einstall || die "einstall failed"
}
