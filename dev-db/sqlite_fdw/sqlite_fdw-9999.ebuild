# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Foreign Data Wrapper for sqlite"
HOMEPAGE="https://github.com/gleu/sqlite_fdw"
SRC_URI=""

EGIT_REPO_URI="https://github.com/gleu/sqlite_fdw.git"

LICENSE="POSTGRESQL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-db/postgresql
	dev-db/sqlite:3
"
RDEPEND="${DEPEND}"

