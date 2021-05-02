# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/ufraw/ufraw-0.17.ebuild,v 1.3 2010/06/21 11:55:48 ssuominen Exp $

EAPI=7
inherit fdo-mime gnome2-utils eutils autotools cvs

DESCRIPTION="RAW Image format viewer and GIMP plugin"
HOMEPAGE="http://ufraw.sourceforge.net/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="contrast fits gimp gnome gtk openmp timezone"

S=${WORKDIR}/${PN}

RDEPEND="
	>=media-gfx/exiv2-0.11
	>=media-libs/jpeg-8a
	=media-libs/lcms-1*
	>=media-libs/lensfun-0.2.5
	media-libs/tiff
	fits? ( sci-libs/cfitsio )
	gnome? ( gnome-base/gconf )
	gtk? ( >=x11-libs/gtk+-2.6:2
		>=media-gfx/gtkimageview-1.5.0 )
	gimp? ( >=x11-libs/gtk+-2.6:2
		>=media-gfx/gtkimageview-1.5.0
		>=media-gfx/gimp-2.0 )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_unpack() {
    ECVS_SERVER="ufraw.cvs.sourceforge.net:/cvsroot/ufraw"
    ECVS_USER="anonymous"
    ECVS_PASS=""
    ECVS_AUTH="pserver"
    CVS_RSH="ssh"
    ECVS_MODULE="ufraw"
    ECVS_CVS_OPTIONS="-d"
    ECVS_BOOTSTRAP="autogen.sh"
    cvs_src_unpack
}


src_configure() {

	${S}/autogen.sh

	local myconf
	use gimp && myconf="--with-gtk"

	econf \
		--without-cinepaint \
		$(use_enable contrast) \
		$(use_with fits cfitsio) \
		$(use_with gimp) \
		$(use_enable gnome mime) \
		$(use_with gtk) \
		$(use_enable openmp) \
		$(use_enable timezone dst-correction) \
		${myconf}
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc README TODO || die
}

pkg_postinst() {
	if use gnome; then
		fdo-mime_mime_database_update
		fdo-mime_desktop_database_update
		gnome2_gconf_install
	fi
}

pkg_postrm() {
	if use gnome; then
		fdo-mime_desktop_database_update
		fdo-mime_mime_database_update
	fi
}
