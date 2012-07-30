# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="Interactive Camera-Projector System"
HOMEPAGE="http://mando.sf.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="v4l"

DEPEND="x11-libs/qt-gui:4
		dev-libs/boost
		media-libs/libdc1394:1
		dev-libs/libxslt
		dev-libs/libf2c
		sci-libs/fftw:3.0
		virtual/glut
		virtual/blas"
RDEPEND="${DEPEND}
		v4l? ( media-libs/libv4l )"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS ChangeLog README || die
	make_desktop_entry ${PN} "Mando"
}
