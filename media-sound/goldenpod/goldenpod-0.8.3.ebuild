# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A simple podcast aggregator written in Perl"
HOMEPAGE="http://random.zerodogg.org/goldenpod"
SRC_URI="http://github.com/downloads/zerodogg/GoldenPod/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="dev-lang/perl
		|| ( net-misc/curl libwww/perl )"

src_install() {
	dodoc AUTHORS COPYING NEWS README TODO
	dobin goldenpod
	doman goldenpod.1
}
