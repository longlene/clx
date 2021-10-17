# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C++11 producer/consumer library for Apache Kafka"
HOMEPAGE="https://github.com/bitbouncer/csi-kafka"
SRC_URI="https://github.com/bitbouncer/csi-kafka/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-cpp/csi-async
"
RDEPEND="${DEPEND}"
