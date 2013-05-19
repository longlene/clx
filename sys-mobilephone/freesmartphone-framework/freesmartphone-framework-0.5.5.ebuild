# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils
inherit git

EAPI=2

DESCRIPTION="The FreeSmartPhone.org framework APIs."
HOMEPAGE="http://www.freesmartphone.org/"

EGIT_REPO_URI="git://git.freesmartphone.org/framework.git"
EGIT_TREE="tags/milestone5.5"
EGIT_PROJECT="framework"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm"
IUSE="gsm gps readline"
DOCS="README"

RDEPEND="dev-python/dbus-python
	dev-python/gst-python
	media-libs/gst-plugins-base
	ogg? ( media-plugins/gst-plugins-ogg )
	vorbis? ( media-plugins/gst-plugins-vorbis )
	ivorbis? ( media-plugins/gst-plugins-ivorbis )
	dev-python/pygobject
	dev-python/pyyaml
	dev-python/pyserial
	dev-python/pyrtc
	alsa? ( dev-python/pyalsaaudio
			virtual/alsa-scenarios )
	dev-lang/python[threads]
	gsm? (
		( || ( sys-mobilephone/gsm0710muxd sys-mobilephone/fso-abyss ) )
		net-dialup/ppp
	)
	gps? ( || ( sci-geosciences/fso-gpsd sci-geosciences/gpsd ) )
	readline? ( sys-libs/readline )"

DEPEND="dev-python/cython
	dev-python/setuptools"

src_prepare() {
	cd "${S}"

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
