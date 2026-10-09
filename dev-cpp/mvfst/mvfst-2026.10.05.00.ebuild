# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="An implementation of the QUIC transport protocol"
HOMEPAGE="https://github.com/facebookincubator/mvfst"
SRC_URI="https://github.com/facebook/mvfst/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND="
	~dev-cpp/fizz-${PV}:=
	~dev-cpp/folly-${PV}:=
	dev-cpp/gflags
	dev-cpp/glog:=[gflags]
	dev-libs/boost
	dev-libs/double-conversion:=
	dev-libs/libfmt:=
	dev-libs/openssl:=
"
RDEPEND="${DEPEND}"
