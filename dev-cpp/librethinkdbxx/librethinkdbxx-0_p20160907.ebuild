# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="11e19e68b891013e2e5e49c51d9a09ee68fade9c"

DESCRIPTION="RethinkDB driver for C++"
HOMEPAGE="https://github.com/AtnNn/librethinkdbxx"
SRC_URI="https://github.com/AtnNn/librethinkdbxx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins build/include/rethinkdb.h
	dolib.so  build/librethinkdb++.so
	use static && dolib.a build/librethinkdb++.a
	dodoc README.md
}
