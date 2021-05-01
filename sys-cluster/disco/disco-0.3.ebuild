# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

DESCRIPTION="A distributed computing map/reduce framework."
HOMEPAGE="http://discoproject.org"
SRC_URI="http://github.com/tuulos/disco/tarball/${PV} -> ${P}.tgz"

LICENSE="nokia"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/erlang-13.2.4
	>=dev-lang/python-2.6"
RDEPEND="${DEPEND}
	virtual/ssh"
#Optionally, DISCO_PROXY needs
#* Lighttpd 1.4.17 or newer

pkg_setup(){
	enewgroup disco
	enewuser disco -1 /bin/sh /var/lib/disco disco
}

src_compile() {
	# Directory that it unpacks to includes repository key
	S="${WORKDIR}"/`ls "${WORKDIR}"`
	cd "${S}"

	sed -i -e '/^DESTDIR=/d' \
	       -e 's:^PREFIX=/usr/local:PREFIX=/usr:' \
		   Makefile
	emake || die "compile failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"

	# Have to do this after 'make install' is done... since undoing 'make
	# install' edits
	dosed "s:${D}::" /etc/disco/settings.py
	dosed "s:^DISCO_ROOT.*:DISCO_ROOT = '/var/lib/disco':" /etc/disco/settings.py
	chown disco:disco "${D}"/etc/disco/settings.py
	mkdir -p "${D}"/var/log/disco/
	chown disco:disco "${D}"/var/log/disco/
	mkdir -p "${D}"/var/run/disco/
	chown disco:disco "${D}"/var/run/disco/
}
