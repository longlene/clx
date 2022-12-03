# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="ZeroMQ-based middleware for xeus"
HOMEPAGE="https://github.com/jupyter-xeus/xeus-zmq"
SRC_URI="https://github.com/jupyter-xeus/xeus-zmq/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/xeus
	net-libs/zeromq
	dev-cpp/cppzmq
	dev-cpp/nlohmann_json
	dev-libs/openssl
	dev-cpp/xtl
"
RDEPEND="${DEPEND}"
BDEPEND=""
