# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="ESoteric COmbine - interpreter of esoteric programing languages
"
HOMEPAGE="http://esco.sourceforge.net/"
SRC_URI="mirror://sourceforge/esco/esco-src-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/gmp"
RDEPEND="${DEPEND}"

src_compile() {
	econf \
		|| die "Configuration failed"
	emake || die "make failed"
}

src_install() {
	make DESTDIR="${D}" install || die "Install failed!"
	dodoc README docs/README_RU.utf8 ChangeLog AUTHORS
}

