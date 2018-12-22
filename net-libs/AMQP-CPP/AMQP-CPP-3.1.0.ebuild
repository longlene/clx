# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="C++ library for asynchronous non-blocking communication with RabbitMQ"
HOMEPAGE="https://github.com/CopernicaMarketingSoftware/AMQP-CPP"
SRC_URI="https://github.com/CopernicaMarketingSoftware/AMQP-CPP/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"