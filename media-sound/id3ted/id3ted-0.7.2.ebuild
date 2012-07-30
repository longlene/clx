# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Command-line ID3 tag editor."
HOMEPAGE="http://id3ted.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="media-libs/taglib sys-apps/file"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${P}-as-needed.patch"
}

src_compile() {
	emake PREFIX="/usr" || die
}

src_install() {
	emake PREFIX="${D}/usr" install || die
}
