# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Jupyter kernel for the C++ programming language"
HOMEPAGE="https://github.com/compiler-research/xeus-cpp"
SRC_URI="https://github.com/compiler-research/xeus-cpp/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/xeus-zmq
	dev-cpp/xtl
	dev-cpp/nlohmann_json
	net-libs/cppzmq
	dev-cpp/argparse
"
RDEPEND="${DEPEND}"
BDEPEND=""
