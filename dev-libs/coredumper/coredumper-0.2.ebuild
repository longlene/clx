# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""

DESCRIPTION="library for making GDB readable cores from multithreaded programs"
HOMEPAGE="http://goog-coredumper.sourceforge.net/"
SRC_URI="mirror://sourceforge/goog-coredumper/${P}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~x86 ~sparc -*"

DEPEND=""

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc README ChangeLog TODO
}