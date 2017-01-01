# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="C++ Kafka Client Library using Boost Asio"
HOMEPAGE="https://github.com/danieljoos/libkafka-asio"
SRC_URI="https://github.com/danieljoos/libkafka-asio/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost[context,threads]
"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r lib/libkafka_asio
	dodoc README.md
}
