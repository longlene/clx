# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="ESoteric COmbine - interpreter of esoteric programing languages"
HOMEPAGE="http://esco.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}-src-${PV}.tbz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/gmp"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README docs/README_RU.utf8 ChangeLog AUTHORS || die "dodoc failed"
}
