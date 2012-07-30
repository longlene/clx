# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils autotools

DESCRIPTION="generates programs menu for all menu-aware applications"
HOMEPAGE="http://qa.debian.org/developer.php?login=ballombe%40debian.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
RESTRICT="mirror"

S="${WORKDIR}/${PN}"

SRC_URI_BASE="mirror://debian/pool/main/${PN:0:1}/${PN}/"
SRC_URI="${SRC_URI_BASE}${PN}_${PV}.tar.gz"

DEPEND=""

src_prepare() {
	echo "SUBDIRS = scripts po-su-to-root" > Makefile.am
	eautoreconf
}

src_install() {
	mkdir "${D}"/usr/sbin
	emake DESTDIR="${D}" install
	doman doc/su-to-root.1
}
