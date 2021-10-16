# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="C++ language bindings library integrating ZeroMQ with Boost Asio"
HOMEPAGE="https://github.com/zeromq/azmq"
SRC_URI="https://github.com/zeromq/azmq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	>dev-libs/boost-1.54[threads]
	dev-cpp/asio
	net-libs/zeromq
"
RDEPEND="${DEPEND}"
