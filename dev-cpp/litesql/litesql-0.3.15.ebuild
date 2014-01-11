# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
MY_P="${PN}-src-${PV}"

inherit autotools

DESCRIPTION="C++ Object-Relational Persistence Framework"
HOMEPAGE="http://sourceforge.net/apps/trac/litesql"
SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc +expat mysql postgresql sqlite"

DEPEND="expat? ( >=dev-libs/expat-2.0.1-r3 )
mysql? ( >=virtual/mysql-5.0 )
postgresql? ( >=dev-db/postgresql-base-8.2.18 )
sqlite? ( >=dev-db/sqlite-2.8.16 )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	rm -rf configure
	eautoreconf
}

src_configure() {
	econf \
		$(use_with expat ) \
		$(use_with mysql ) \
		$(use_with postgresql pgsql ) \
		$(use_with sqlite sqlite3 ) || die "Could not configure source"
}

src_install() {
	emake install DESTDIR="${D}" || die "Install failed"
	use !doc && rm -rf "${D}/usr/share"
}
