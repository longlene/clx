# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Asynchronous MQTT communication library based on Boost.Asio"
HOMEPAGE="https://github.com/redboltz/async_mqtt"
SRC_URI="https://github.com/redboltz/async_mqtt/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/boost
"
RDEPEND="${DEPEND}"
BDEPEND=""
