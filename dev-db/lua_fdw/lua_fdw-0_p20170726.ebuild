# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="5577a0d886b7a07cff70b7825294087c14e8272e"

DESCRIPTION="Lua Foreign Data Wrapper for PostgreSQL"
HOMEPAGE="https://github.com/seanpringle/lua_fdw"
SRC_URI="https://github.com/seanpringle/lua_fdw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-db/postgresql"
RDEPEND="${DEPEND}"
