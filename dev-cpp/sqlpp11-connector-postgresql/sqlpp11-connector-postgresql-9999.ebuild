# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils git-r3

DESCRIPTION="PostgreSQL connector for sqlpp11 library"
HOMEPAGE="https://github.com/matthijs/sqlpp11-connector-postgresql"
SRC_URI=""

EGIT_REPO_URI="https://github.com/matthijs/sqlpp11-connector-postgresql.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-cpp/sqlpp11
	dev-db/postgresql
"
RDEPEND="${DEPEND}"
