# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="rabbitcpp is a C++ library for Message Queue Server RabbitMQ"
HOMEPAGE="https://github.com/akalend/amqpcpp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/akalend/amqpcpp.git"

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
