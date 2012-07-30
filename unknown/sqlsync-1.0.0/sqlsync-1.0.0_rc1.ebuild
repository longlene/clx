# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator eutils
MY_PV=$(replace_version_separator 3 '-')


DESCRIPTION="Utility for comparing and synchronizing data stored in two SQL databases."
HOMEPAGE="http://silvercoders.com/"
MY_P="${PN}-${MY_PV}"
MY_S="${WORKDIR}/${MY_P}"
SRC_URI="http://silvercoders.com/download/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-db/unixODBC-2.2.12"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
}

src_compile() {
	cd "${MY_S}"
	emake WITH_STATIC=NO WITH_SHARED=YES|| die
}

src_install() {
	cd "${MY_S}"
	dobin src/sqlsync
	dolib lib/libsqlsync.so
	dodoc AUTHORS ChangeLog VERSION doc/sqlsync_en.pdf doc/sqlsync_pl.pdf 
}
