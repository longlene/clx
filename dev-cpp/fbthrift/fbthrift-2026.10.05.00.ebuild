# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Facebook's branch of Apache Thrift"
HOMEPAGE="https://github.com/facebook/fbthrift"
SRC_URI="https://github.com/facebook/fbthrift/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="benchmark"
RESTRICT="test"

# The new compiler installs /usr/bin/thrift, which upstream Apache Thrift
# provides as well; the two are not API-compatible, pick one.
CONFLICT="dev-libs/thrift"

# The RPC transport stack (fizz/wangle/mvfst) is on by default upstream and
# the compiler+lib are the point of the package; benchmarks are opt-in.
DEPEND="
	benchmark? ( dev-cpp/benchmark )
	~dev-cpp/fizz-${PV}:=
	~dev-cpp/folly-${PV}:=
	dev-cpp/gflags
	dev-cpp/glog
	~dev-cpp/mvfst-${PV}:=
	~dev-cpp/wangle-${PV}:=
	dev-libs/boost
	dev-libs/openssl
	dev-libs/xxhash
	virtual/zlib
	app-arch/zstd
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DTHRIFT_RPC=ON
		-DTHRIFT_BENCHMARKS=$(usex benchmark)
		# Python bindings stay off (same as the 2023 ebuild).
		-DTHRIFT_PY_DEPRECATED=OFF
		-DTHRIFT_PYTHON=OFF
	)
	cmake_src_configure
}
