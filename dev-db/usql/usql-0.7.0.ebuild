# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/knq/usql"

DESCRIPTION="usql is a universal command-line interface for SQL databases"
HOMEPAGE="https://github.com/knq/usql"
SRC_URI="https://github.com/knq/usql/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-go/go-hdb
	dev-go/readline
	dev-go/go-mssqldb
	dev-go/mysql
	dev-go/go-arg
	dev-go/dburl
	dev-go/xoutil
	dev-go/pq
	dev-go/go-isatty
	dev-go/go-sqlite3
	dev-go/ora
	dev-go/tablewriter
"
