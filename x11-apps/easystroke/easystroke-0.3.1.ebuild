# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Easystroke is a gesture-recognition application for X11."
HOMEPAGE="http://easystroke.wiki.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/${PN}/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

DEPEND="dev-libs/boost
		>=dev-cpp/gtkmm-2.12.0
		dev-libs/dbus-glib
		dev-libs/libxml2
		doc? ( app-text/texlive-core )"
RDEPEND="${DEPEND}"

src_compile() {
	emake DESTDIR="${D}" PREFIX="/usr/" || die "emake failed!"
	if use doc ; then
		cd doc && emake
	fi
}
src_install() {
	emake DESTDIR="${D}" PREFIX="/usr/" install || die "emake install failed!"
	use doc && dodoc doc/algo.pdf
}
