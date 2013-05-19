# Copyright 2008 Arvid Norlander
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=2

inherit eutils distutils

DESCRIPTION="PyGopherd: Advanced, multi-protocol Gopher server"
HOMEPAGE="http://gopher.quux.org:70/devel/gopher/pygopherd"
SRC_URI="http://gopher.quux.org:70/devel/gopher/Downloads/pygopherd/pygopherd_${PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

S="${WORKDIR}/${PN}"

pkg_setup() {
	enewgroup gopher 30
	enewuser gopher 30 -1 -1 gopher
}

src_install() {
	# Because it is installed globally, we just need the global part
	sed -i '/^mimetypes/s|./conf/mime.types:||' "${S}"/conf/pygopherd.conf || die "sed failed"
	# For gentoo's .keep file to be ignored
	sed -i '/^ignorepatt/s:$:|/\\.keep$:' "${S}"/conf/pygopherd.conf || die "sed failed"
	distutils_src_install
	newinitd "${FILESDIR}"/pygopherd.rc pygopherd || die "newinitd failed"
	newenvd "${FILESDIR}"/10pygopherd.env 10pygopherd || die "newenvd failed"
	doman "${S}"/doc/pygopherd.8
	dodir /var/gopher || die "dodir /var/gopher failed"
	keepdir /var/gopher || die "keepdir /var/gopher failed"
	insinto /var/gopher
	# we should not install example gophermap if one exists already
	# to avoid user data breakage
	[ -f /var/gopher/gophermap ] || doins "${S}"/examples/gophermap
}


pkg_postinst() {
	distutils_pkg_postinst
	echo
	elog "Please configure /etc/${PN}/${PN}.conf before attempt to use it!"
	elog "Also it may be a good idea to put something in /var/lib/gopher."
	echo
}
