# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C++14 implementation of the TLS-1.3 standard"
HOMEPAGE="https://github.com/facebookincubator/fizz"
SRC_URI="https://github.com/facebookincubator/fizz/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/folly
	dev-cpp/gflags
	dev-cpp/glog
	dev-libs/double-conversion
	dev-libs/libevent
	dev-libs/libfmt
	dev-libs/libsodium
	dev-libs/openssl
	app-arch/zstd
"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="fizz"
