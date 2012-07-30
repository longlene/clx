# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Game engine for quiz shows based upon multiple choice questions."
HOMEPAGE="http://quimeleon.sourceforge.net/"

SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

IUSE=""


DEPEND=">=dev-cpp/libxmlpp-2.6
	>=dev-cpp/gtkmm-2.8
	>=gnome-base/librsvg-2.8.1
	>=media-libs/libao-0.8.6
	>=media-libs/libvorbis-1.1"

RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
