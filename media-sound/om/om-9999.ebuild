# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cvs

IUSE="alsa debug dssi gtk ladspa lash patch-loader"
DESCRIPTION="Modular audio synthesizer using Jack, LADSPA, DSSI etc. (CVS version)"
HOMEPAGE="http://www.nongnu.org/om-synth/"
SRC_URI=""
S="${WORKDIR}/om-synth"

LICENSE="GPL-2"
KEYWORDS="-amd64 -x86"

SLOT="0"

RDEPEND=">=media-libs/liblo-0.22
	media-sound/jack-audio-connection-kit
	alsa? ( >=media-libs/alsa-lib-1.0 )
	dssi? ( media-libs/dssi )
	ladspa? ( media-libs/ladspa-sdk )
	lash? ( >=media-sound/lash-0.5.0 )
	patch-loader? ( >=dev-libs/libxml2-2.6
		gtk? ( >=dev-cpp/gtkmm-2.4
			>=dev-cpp/libgnomecanvasmm-2.6
			dev-cpp/flowcanvas
			>=dev-cpp/libglademm-2.4.1) )"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_unpack() {
	ECVS_SERVER="cvs.savannah.nongnu.org:/sources/om-synth"
	ECVS_USER="anonymous"
	ECVS_PASS=""
	ECVS_AUTH="pserver"
	ECVS_MODULE="om-synth"
	ECVS_TOP_DIR="${DISTDIR}/cvs-src/${ECVS_MODULE}"
    cvs_src_unpack
}

src_compile() {
# Building gtk-client needs the patch-loader, too.
	local myconf
	if use gtk; then
		myconf="${myconf} --enable-gtk-client --enable-patch-loader"
	elif use patch-loader; then
		myconf="${myconf} --enable-patch-loader"
	fi

	./autogen.sh
	econf \
		$(use_enable alsa) \
		$(use_enable debug) \
		$(use_enable dssi) \
		$(use_enable ladspa) \
		$(use_enable lash) \
		${myconf} \
		|| die

	emake || die
}

src_install() {
	make DESTDIR=${D} install || die
	dodoc AUTHORS ChangeLog NEWS README THANKS TODO
}


