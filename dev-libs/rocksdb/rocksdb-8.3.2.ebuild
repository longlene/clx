# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Embeddable, persistent key-value store for fast storage"
HOMEPAGE="http://rocksdb.org https://github.com/facebook/rocksdb/"
SRC_URI="https://github.com/facebook/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE="jemalloc snappy static-libs"

DEPEND="
	app-arch/bzip2:=
	app-arch/lz4:=
	snappy? ( app-arch/snappy:= )
	app-arch/zstd:=
	dev-cpp/gflags:=
	sys-libs/liburing:=
	sys-libs/zlib:=
	jemalloc? ( dev-libs/jemalloc:= )
"
RDEPEND="${DEPEND}"

src_configure() {
	sed -i -e '/find_program(CCACHE_FOUND ccache)/d' CMakeLists.txt || die

	local mycmakeargs=(
		-DFAIL_ON_WARNINGS=OFF
		-DWITH_JEMALLOC=$(usex jemalloc)
		-DWITH_SNAPPY=$(usex snappy)
		-DWITH_ZLIB=ON
		-DWITH_ZSTD=ON
		# They're just examples/benchmarks.
		-DWITH_TESTS=OFF
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install

	if ! use static-libs; then
		rm "${ED}"/usr/$(get_libdir)/*.a || die
	fi
}
