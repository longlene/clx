# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="184f3788809e68c897a6b2def34a5e9377278fa8"

DESCRIPTION="Lightningdbm is a thin wrapper around OpenLDAP Lightning Memory-Mapped Database (LMDB)"
HOMEPAGE="https://github.com/shmul/lightningmdb"
SRC_URI="https://github.com/shmul/lightningmdb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-db/lmdb
"
RDEPEND="${DEPEND}"

src_compile() {
	emake so
}

src_install() {
	lua_install_cmodule lightningmdb.so
	dodoc README.md
}
