# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="5a9eaa45171b9bd07cc25319e8a2ab93c2e8c89a"

DESCRIPTION="rabbitcpp is a C++ library for Message Queue Server RabbitMQ"
HOMEPAGE="https://github.com/akalend/amqpcpp"
SRC_URI="https://github.com/akalend/amqpcpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	net-libs/rabbitmq-c
"
RDEPEND="${DEPEND}"

src_install() {
	dolib.a libqmqpcpp.a
	insinto /usr/include
	doins include/AMQPcpp.h
	dodoc README
}
