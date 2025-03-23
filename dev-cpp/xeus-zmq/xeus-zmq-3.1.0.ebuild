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
	>=dev-cpp/xeus-5.0.0
	>=net-libs/zeromq-4.2.5
	>=net-libs/cppzmq-4.8.1
	>=dev-cpp/nlohmann_json-3.11.3
	>=dev-libs/openssl-3.0
"
RDEPEND="${DEPEND}"
BDEPEND=""
