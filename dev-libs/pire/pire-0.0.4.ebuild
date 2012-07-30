# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Perl Incompatible Regular Expressions library"
HOMEPAGE="https://github.com/dprokoptsev/pire"
SRC_URI="http://cloud.github.com/downloads/dprokoptsev/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="debug extra static test"

DEPEND="test? ( dev-util/cppunit )"
RDEPEND=""

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable extra) \
		$(use_enable static) \
		|| die "econf failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README
}

src_test() {
	emake check || die "emake check failed"
}
