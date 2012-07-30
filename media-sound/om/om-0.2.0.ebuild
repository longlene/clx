# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Modular audio synthesizer using Jack, LADSPA, DSSI etc."
HOMEPAGE="http://www.nongnu.org/om-synth/"
SRC_URI="http://savannah.nongnu.org/download/om-synth/${P}.tar.gz"

IUSE="alsa debug dssi gtk ladspa lash patch-loader"
LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"

RDEPEND=">=media-libs/liblo-0.22
	media-sound/jack-audio-connection-kit
	alsa? ( >=media-libs/alsa-lib-1.0 )
	dssi? ( media-libs/dssi )
	ladspa? ( media-libs/ladspa-sdk )
	lash? ( >=media-sound/lash-0.5.0 )
	patch-loader? ( >=dev-libs/libxml2-2.6i )
	gtk? ( >=dev-cpp/gtkmm-2.4
		>=dev-cpp/libgnomecanvasmm-2.6
		>=dev-cpp/libglademm-2.4.1 )"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

pkg_setup() {
	if use gtk && !use patch-loader ; then
		eerror "USE="gtk" requires USE="patch-loader" too."
		die
	fi
}

src_compile() {

	econf \
		$(use_enable alsa) \
		$(use_enable debug) \
		$(use_enable dssi) \
		$(use_enable ladspa) \
		$(use_enable lash) \
		$(use_enable patch-loader) \
		$(use_enable gtk gtk-client) \
		|| die "econf failed"

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR=${D} install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README THANKS TODO
}

pkg_postinst() {
	einfo ""
	einfo "NOTE: If you want to be able to run the om-synth example"
	einfo "patches (in /usr/share/om/patches/), please install the"
	einfo "media-plugins/omins (>=0.2.0) package, too."
	einfo ""
}
