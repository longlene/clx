# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit qt4-r2

DESCRIPTION="Simple shell utility to convert html to pdf using webkit and qt4"
HOMEPAGE="http://code.google.com/p/wkhtmltopdf/"
SRC_URI="http://wkhtmltopdf.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mng tiff"

DEPEND="x11-libs/qt-core:4
	x11-libs/qt-gui:4[mng=,tiff=]
	x11-libs/qt-svg:4
	x11-libs/qt-webkit:4
	x11-libs/qt-xmlpatterns:4"
RDEPEND="${DEPEND}"

src_configure() {
	# remove warning because of non-existing files
	sed -i -e 's#QtGui.framework/#lib#' common.pri || die

	eqmake4 ${PN}.pro -recursive || die "qmake4 failed"
}

src_install() {
	emake INSTALL_ROOT="${D}/usr" install || die "emake install failed"
	dodoc README_WKHTMLTOIMAGE README_WKHTMLTOPDF || die "dodoc failed"
}
