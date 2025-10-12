# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An asynchronous msgpack-RPC and JSON-RPC library built on top of Boost.Asio"
HOMEPAGE="https://github.com/qchateau/packio"
SRC_URI="https://github.com/qchateau/packio/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/msgpack
	dev-cpp/nlohmann_json
	|| ( dev-libs/boost dev-cpp/asio )
"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/packio
	einstalldocs
}
