# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Eet is primarily a data encoding, decoding and storage library."
HOMEPAGE="http://enlightenment.org/p.php?p=about/efl/eet&l=en"
SRC_URI="http://download.enlightenment.org/releases/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

DEPEND="media-libs/jpeg
	sys-libs/zlib
	doc? ( app-doc/doxygen )"

src_install() {
	emake DESTDIR="${D}" install || "make install failed"

	# docs
	if use doc; then
		dohtml -r doc/html/*
	fi
	dodoc AUTHORS ChangeLog NEWS README
}
