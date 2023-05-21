# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="0a00b0ec5d730d33585b749d701f2c7af793b720"

DESCRIPTION="C++ client library for PostgreSQL"
HOMEPAGE="https://github.com/taocpp/taopq"
SRC_URI="https://github.com/taocpp/taopq/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-db/postgresql
"
RDEPEND="${DEPEND}"
BDEPEND=""
