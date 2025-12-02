# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="pgvector support for C++"
HOMEPAGE="https://github.com/pgvector/pgvector-cpp"
SRC_URI="https://github.com/pgvector/pgvector-cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libpqxx
"
RDEPEND="${DEPEND}"
BDEPEND=""
