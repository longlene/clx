# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="An open-source framework for proximity-based peer-to-peer applications"
HOMEPAGE="https://github.com/zeromq/zyre"
SRC_URI="https://github.com/zeromq/zyre/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libsodium
	net-libs/zeromq
	net-libs/czmq
"
RDEPEND="${DEPEND}"
BDEPEND=""
