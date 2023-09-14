# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

MY_PV=${PV//./_}

DESCRIPTION="yet another SQLite wrapper"
HOMEPAGE="https://kristaps.bsd.lv/ksql"
SRC_URI="https://github.com/kristapsdz/ksql/archive/VERSION_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-db/sqlite"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	cat >configure.local <<EOF
PREFIX="${D}"/usr
LIBDIR="${D}"/usr/$(get_libdir)
MANDIR="${D}"/usr/share/man
EOF
}

src_configure() {
	./configure || die
}

#src_install() {
#	insinto /usr/include
#	doins ksql.h
#	dolib.a libksql.a
#	dodoc README.md
#	doman *.3
#}
