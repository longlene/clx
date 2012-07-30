# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A frontend to surf to visualize algebraic curves and algebraic surfaces"
HOMEPAGE="http://imaginary2008.de/surfer.php"
SRC_URI="http://www.imaginary2008.de/data/surfer-rev-${PV}-source.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="
	>=dev-cpp/gtkmm-2.12.1
	>=media-gfx/surf-1.0.5
"

S=${WORKDIR}/surfer-source-rev-${PV}/surfer-rev-${PV}
bd=${WORKDIR}/surfer-source-rev-${PV}

src_compile() {
	econf || die "configure failed"
	emake || die "make failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodir /usr/share/${PN}/gallery
	insinto /usr/share/${PN}/gallery
	doins -r ${bd}/gallery-rev-${PV}/*
	dodoc ${S}/README ${S}/AUTHORS ${bd}/surfer-anleitung.pdf
}

pkg_postinst() {
	einfo
	einfo "Set \"gallery\" to \"/usr/share/${PN}/gallery\" in ~/.surfer"
	einfo "to access the sample galleries that come with surfer"
	einfo
}
