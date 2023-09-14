# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools vcs-snapshot

DESCRIPTION="Perl Incompatible Regular Expressions library"
HOMEPAGE="https://github.com/yandex/pire"
SRC_URI="https://github.com/yandex/pire/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug extra static test"

DEPEND="test? ( dev-util/cppunit )"
RDEPEND=""

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable extra) \
		$(use_enable static)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README
}

src_test() {
	emake check || die "emake check failed"
}
