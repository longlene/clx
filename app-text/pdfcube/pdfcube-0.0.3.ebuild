# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="an OpenGL API-based 3D PDF viewer"
HOMEPAGE="http://code.100allora.it/pdfcube/"
SRC_URI="http://code.100allora.it/releases/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-libs/glib-2.0.0
	>=x11-libs/gtk+-2.0.0
	>=x11-libs/gtkglext-1.0.0
	>=app-text/poppler-0.4.5
	>=app-text/poppler-bindings-0.4.5
	>=dev-libs/boost-1.33.1"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
	dodoc README AUTHORS ChangeLog
}
