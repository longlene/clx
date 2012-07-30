# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="secure mesh networking VPN"
HOMEPAGE="http://exa.czweb.org/"
SRC_URI="http://exa.czweb.org/releases/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/openssl"
DEPEND="dev-util/scons ${RDEPEND}"

src_compile () {
	# dont pass make's -l option, as scons uses it differently.
	scons ${MAKEOPTS/-l[0-9]} || die "compilation failed"
}

src_install () {
	dobin cloudvpn extras/initscripts/cloudctl || die
	doman extras/man/cloudvpn.1 || die
}

