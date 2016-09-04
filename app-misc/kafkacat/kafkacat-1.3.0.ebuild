# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Generic command line non-JVM Apache Kafka producer and consumer"
HOMEPAGE="https://github.com/edenhill/kafkacat/"
SRC_URI="https://github.com/edenhill/kafkacat/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/librdkafka"
RDEPEND="${DEPEND}"
