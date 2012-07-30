# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="3"

MY_PV=${PV/_p/ubuntu}
DESCRIPTION="Jewish Book Collection for use with Orayta (app-text/orayta)"
HOMEPAGE="http://orayta.googlecode.com/"
SRC_URI="https://launchpad.net/~moshe-wagner/+archive/orayta/+files/${PN}_${MY_PV}.tar.gz"

LICENSE="GPL-2 LGPL-2.1 LGPL-3 CCPL-Attribution-ShareAlike-NonCommercial-2.5
		CCPL-Attribution-ShareAlike-3.0 FDL-1.3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

S="${WORKDIR}/books"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}