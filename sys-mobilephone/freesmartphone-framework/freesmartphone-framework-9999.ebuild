# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils
inherit git-2

EAPI=2

DESCRIPTION="The FreeSmartPhone.org framework APIs."
HOMEPAGE="http://www.freesmartphone.org/"

EGIT_REPO_URI="git://git.freesmartphone.org/framework.git"
EGIT_PROJECT="framework"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="gsm gps readline"
DOCS="README"

RDEPEND="dev-python/dbus-python
	dev-python/gst-python
	dev-python/pygobject
	dev-python/pyyaml
	dev-python/pyserial
	dev-python/pyrtc
	media-libs/gstreamer
	media-libs/gst-plugins-good
	media-libs/gst-plugins-bad
	media-plugins/gst-plugins-sidplay
	media-plugins/gst-plugins-mad
	media-plugins/gst-plugins-ivorbis
	media-plugins/gst-plugins-vorbis
	dev-python/pyalsaaudio
	dev-lang/python[threads]
	virtual/alsa-scenarios
	gsm? ( 
		( || ( sys-mobilephone/gsm0710muxd sys-mobilephone/fso-abyss ) )
		net-dialup/ppp
	)
	gps? ( || ( sci-geosciences/fso-gpsd sci-geosciences/gpsd ) )
	readline? ( sys-libs/readline )"
DEPEND="dev-python/cython
	dev-python/setuptools"

src_prepare() {
	# Change the paths for setup.py and add the example config file
	epatch "${FILESDIR}/${P}-setup-paths.patch"
}

src_install() {
	distutils_src_install
	newinitd "${FILESDIR}/frameworkd" frameworkd
	insinto /etc
	doins conf/example/frameworkd.conf
}

pkg_postinst() {
	einfo "An example configuration file was installed to /etc/frameworkd.conf,"
	einfo "please modify this configuration file to your needs!"
}
