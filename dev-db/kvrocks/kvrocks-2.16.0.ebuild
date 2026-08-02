# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Distributed key value NoSQL database using RocksDB, Redis-protocol compatible"
HOMEPAGE="https://kvrocks.apache.org https://github.com/apache/kvrocks"

SRC_URI="https://github.com/apache/kvrocks/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+ssl"
RESTRICT="test"

DEPEND="ssl? ( dev-libs/openssl:= )"
RDEPEND="${DEPEND}"
BDEPEND="dev-build/ninja"

src_prepare() {
	cmake_src_prepare
	# Copy vendored deps into WORKDIR/deps for DEPS_FETCH_DIR.
	# kvrocks 2.16.0 uses FetchContent with DEPS_FETCH_DIR support
	# to find pre-downloaded dependency tarballs locally instead of
	# fetching from GitHub at build time.
	mkdir -p "${WORKDIR}/deps"
	local f
	for f in "${DISTDIR}"/*.zip; do
		[ -f "${f}" ] || continue
		local base
		base="$(basename "${f}")"
		# Skip the main kvrocks tarball
		[[ "${base}" == "${P}.gh.tar.gz" ]] && continue
		cp --no-preserve=all "${f}" "${WORKDIR}/deps/"
	done
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_OPENSSL=$(usex ssl)
		-DENABLE_STATIC_LIBSTDCXX=OFF
		-DENABLE_LTO=OFF
		-DEPS_FETCH_DIR="${WORKDIR}/deps"
	)
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}"/kvrocks
	dobin "${BUILD_DIR}"/kvrocks2redis
	dodoc README.md
	insinto /etc/kvrocks
	newins kvrocks.conf kvrocks.conf
	keepdir /var/lib/kvrocks
	keepdir /var/log/kvrocks
}
