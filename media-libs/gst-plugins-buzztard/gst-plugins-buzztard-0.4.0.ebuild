# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-pulse/gst-plugins-pulse-0.9.4.ebuild,v 1.1 2006/12/17 19:26:35 lack Exp $

MY_PN='gst-buzztard'
DESCRIPTION="gst-buzztard is a GStreamer 0.10 plugin for the Buzztard music
environment."
HOMEPAGE="http://www.buzztard.org/"
SRC_URI="http://downloads.sourceforge.net/${MY_PN/gst-}/${MY_PN}-${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT=0.10
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="=media-libs/gstreamer-0.10*
		media-libs/gst-plugins-base"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S="${WORKDIR}/${MY_PN}-${PV}"

src_compile() {
	econf --disable-lynx || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dohtml -r doc
	dodoc README
}
