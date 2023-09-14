# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="An input event router"
HOMEPAGE="http://www.bedroomlan.org/~alexios/coding_evrouter.html"

SRC_URI="http://www.bedroomlan.org/~alexios/files/SOFTWARE/evrouter/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="X xmms"

# Build-time dependencies, such as
#    ssl? ( >=dev-libs/openssl-0.9.6b )
#    >=dev-lang/perl-5.6.1-r1
# It is advisable to use the >= syntax show above, to reflect what you
# had installed on your system when you tested the package.  Then
# other users hopefully won't be caught without the right version of
# a dependency.
DEPEND="X? ( virtual/x11 )
	xmms? ( >=media-sound/xmms-1.2.10-r5 )"

S=${WORKDIR}/${PN}

src_compile() {
	myconf="$(use_with X x) $(use_with xmms)"

	econf || die "could not configure"
	emake || die "emake failed"
}

src_install() {
	einstall || die "einstall failed"
}
