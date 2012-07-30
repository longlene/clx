# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

WANT_AUTOCONF=latest
WANT_AUTOMAKE=latest

inherit autotools

DESCRIPTION="unac is a C library and a command line tool that removes accents from characters."
HOMEPAGE="http://www.senga.org/"
SRC_URI="mirror://debian/pool/main/u/unac/${P/-/_}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="virtual/libiconv"
DEPEND="${RDEPEND}
	dev-lang/perl"

S="${WORKDIR}/${P}.orig"

src_unpack() {
	unpack ${A}
	cd "${S}"
	# otherwise automake will fail
	touch config.rpath
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NEWS README THANKS
	doman unaccent.1 unac.3
}

pkg_postinst() {
	einfo
	einfo "Examples of using unaccent from the command line:"
	einfo "unaccent utf8 été"
	einfo "echo -e '\\\\0303\\\\0251t\\\\0303\\\\0251' | unaccent utf8"
	einfo "unaccent ISO-8859-1 < myfile > myfile.unaccent"
	einfo
	einfo "man unaccent and man unac for more information."
}
