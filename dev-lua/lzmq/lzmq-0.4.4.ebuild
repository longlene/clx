# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake lua

DESCRIPTION="Lua binding to ZeroMQ"
HOMEPAGE="https://github.com/zeromq/lzmq"
SRC_URI="https://github.com/zeromq/lzmq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-libs/zeromq
"
RDEPEND="${DEPEND}"
