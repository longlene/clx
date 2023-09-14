# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="93fd27eca66554018f0eb8fa6184bfb6579ff578"

DESCRIPTION="Foreign Data Wrapper for sqlite"
HOMEPAGE="https://github.com/aganatramoat/sqlite_fdw"
SRC_URI="https://github.com/aganatramoat/sqlite_fdw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-db/postgresql"
RDEPEND="${DEPEND}"
