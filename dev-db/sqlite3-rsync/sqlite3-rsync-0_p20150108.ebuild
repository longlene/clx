# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Synchronizes SQLite3 databases from client to server using table ROWIDs"
HOMEPAGE="https://github.com/unmanarc/sqlite3_rsync"

MY_COMMIT="1af0af826332c50944b76dcf8bbfea12274e86d7"
SRC_URI="https://github.com/unmanarc/sqlite3_rsync/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/sqlite3_rsync-${MY_COMMIT}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-db/sqlite:3"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/pthread-include.patch
)
