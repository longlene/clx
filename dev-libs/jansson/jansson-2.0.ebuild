# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils

DESCRIPTION=" C library for encoding, decoding and manipulating JSON data"
HOMEPAGE="http://www.digip.org/jansson/"
SRC_URI="http://www.digip.org/jansson/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc static-libs"

DEPEND="doc? ( dev-python/sphinx )"
RDEPEND=""

src_configure() {
	econf \
		$(use_enable static-libs static)
}

src_compile() {
	emake || die

	if use doc; then
		emake html || die
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die

	# remove useless .a and .la files (only for non static compilation)
	use static-libs || find "${D}" \( -name '*.a' -or -name '*.la' \) -delete

	dodoc CHANGES README.rst

	if use doc; then
		dohtml -r doc/_build/html/* || die "Installation of documentation failed"
	fi
}
