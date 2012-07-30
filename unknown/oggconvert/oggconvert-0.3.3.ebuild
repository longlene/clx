# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="Utility to convert media into the Vorbis audio and the Theora/Dirac/WebM video formats."
HOMEPAGE="http://oggconvert.tristanb.net/"
SRC_URI="http://oggconvert.tristanb.net/releases/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="dirac vpx theora"

RDEPEND=">=media-libs/gst-plugins-base-0.10.11
	media-plugins/gst-plugins-vorbis
	dirac? ( >=media-plugins/gst-plugins-schroedinger-0.10.14 )
	vpx? ( media-plugins/gst-plugins-vp8
		>=media-libs/gst-plugins-bad-0.10.19 )
	theora? ( media-plugins/gst-plugins-theora )
	dev-python/pygtk
	gnome-base/libglade
	dev-python/gst-python"
