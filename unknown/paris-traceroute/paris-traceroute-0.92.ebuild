# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils toolchain-funcs

DESCRIPTION="Utility to trace the route of IP packets"
HOMEPAGE="http://www.paris-traceroute.net/"
SRC_URI="http://www.paris-traceroute.net/downloads/${P}-dev.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="static debug"

DEPEND=""
RDEPEND=""
#
src_unpack() {
	unpack ${A}
	ls -al /var/tmp/portage/net-analyzer/paris-traceroute-0.92/work
	mv `echo ${S} | sed 's/-0.92$/-current/'` ${S}
}

src_compile() {
	econf \
		$(use_enable debug static) \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	dobin src/paris-traceroute
	doman man/paris-traceroute.8
	dodoc AUTHORS README
}
