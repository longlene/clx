# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Libtubo Interprocess Communication is a small and simple \
library to run processes in the background and communicate via the \
stdout, stderr, and stdin file descriptors."
HOMEPAGE="http://xffm.sf.net/libtubo.html"
SRC_URI="mirror://sourceforge/xffm/${P}.tar.gz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="~x86"
IUSE="gtk-doc"

DEPEND="gtk-doc? ( dev-util/gtk-doc )"

src_compile() {
	econf \
	--with-x \
	$(use_enable gtk-doc) \
	|| die "econf failed."
}

src_install() {
	make DESTDIR=${D} install || die "make failed."
	dohtml -r doc/html/*
}
