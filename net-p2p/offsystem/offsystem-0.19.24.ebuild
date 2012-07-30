# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1
inherit wxwidgets

DESCRIPTION="a distributed filesystem in which everything is stored in reference to randomized data blocks"
HOMEPAGE="http://offsystem.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/OFFSystem-${PV}-src.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug gtk"

DEPEND="dev-libs/openssl
	gtk? ( x11-libs/wxGTK:2.8
		media-libs/libpng
		media-libs/jpeg
		media-libs/tiff )
	!gtk? ( sys-libs/readline )"
RDEPEND=""

src_compile() {
	cd ${WORKDIR}/off_network/build_gtk
	if use debug; then
		debug="debug"
	else
		debug="release"
	fi

	if use gtk; then
		WX_GTK_VER=2.8
		need-wxwidgets gtk2
		headless="no"
	else
		headless="yes"
	fi

	emake \
	HEADLESS=${headless} ${debug} || die "make failed"
}

src_install() {
	cd ${WORKDIR}/off_network/build_gtk
	make DESTDIR="${D}" install || die "install failed"
}
