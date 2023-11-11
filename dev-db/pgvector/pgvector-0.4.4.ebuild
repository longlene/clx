# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Open-source vector similarity search for Postgres"
HOMEPAGE="https://github.com/pgvector/pgvector"
SRC_URI="https://github.com/pgvector/pgvector/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-db/postgresql
"
RDEPEND="${DEPEND}"
BDEPEND=""
