# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="b45da643b9cd700b0556f1174b117786cced0242"

DESCRIPTION="SQLite ORM light header only library for modern C++"
HOMEPAGE="https://github.com/fnc12/sqlite_orm"
SRC_URI="https://github.com/fnc12/sqlite_orm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/sqlite
"

src_install() {
	insinto /usr/include
	doins -r include/sqlite_orm
	dodoc README.md
}
