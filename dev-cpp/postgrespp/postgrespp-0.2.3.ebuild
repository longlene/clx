# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A thin libpq wrapper in C++ for PostgreSQL"
HOMEPAGE="https://github.com/tghosgor/postgrespp"
SRC_URI="https://github.com/tghosgor/postgrespp/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/boost
	dev-db/postgresql
"
RDEPEND="${DEPEND}"
BDEPEND=""
