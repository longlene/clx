# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="An Integrated Development Environment for producing eLearning"
HOMEPAGE="http://www.salasaga.org/"
SRC_URI="http://www.salasaga.org/downloads/alpha6_dev/salasaga_20090607.tar.bz2"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="sys-devel/autoconf
	>=sys-devel/automake-1.10
	dev-util/pkgconfig
	dev-libs/glib
	x11-libs/gtk+
	gnome-base/libgnome
	media-libs/libpng
	media-libs/jpeg
	dev-libs/libxml2
	sys-libs/zlib
	gnome-base/gconf
	>=media-libs/ming-0.3.0"

DEPEND="${RDEPEND}"

src_compile() {
	mv ${WORKDIR}/salasaga ${WORKDIR}/${P}
	cd "${S}" || die "Directory not found"
	./autogen.sh || die "Autoconfig failed"
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall || die "Install failed"
}

