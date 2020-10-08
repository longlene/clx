# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

DESCRIPTION="The Universal Storage Engine"
HOMEPAGE="https://tiledb.com/"
SRC_URI="https://github.com/TileDB-Inc/TileDB/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-arch/bzip2
	app-arch/lz4
	app-arch/zstd
	dev-libs/openssl
	dev-libs/spdlog
	sys-libs/zlib
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DTILEDB_SUPERBUILD=OFF
		-DTILEDB_TESTS=OFF
	)
	cmake-utils_src_configure
}
