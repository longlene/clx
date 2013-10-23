# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils
inherit git-2

DESCRIPTION="The FreeSmartPhone.org framework APIs."
HOMEPAGE="http://www.freesmartphone.org/"

#EGIT_REPO_URI="git://git.freesmartphone.org/framework.git"
EGIT_REPO_URI="git://git.debian.org/pkg-fso/fso-frameworkd.git"
EGIT_TREE="tags/milestone5"
EGIT_PROJECT="framework"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE="gsm gps readline"
DOCS="README"

RDEPEND="dev-python/dbus-python
	 dev-python/gst-python
	 dev-python/pygobject
	 dev-python/pyyaml
	 dev-python/pyserial
	 dev-lang/python[threads]
	 virtual/alsa-scenarios
	 gsm? ( sys-mobilephone/gsm0710muxd )
	 gps? ( sci-geosciences/gpsd )
	 readline? ( sys-libs/readline )"
DEPEND="dev-python/cython
		dev-python/setuptools"

src_unpack() {
	# Fetch and unpack current git sources
	git_src_unpack

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
