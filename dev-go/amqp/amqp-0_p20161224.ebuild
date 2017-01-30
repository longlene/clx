# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/streadway/amqp"
EGIT_COMMIT="63795daa9a446c920826655f26ba31c81c860fd6"

DESCRIPTION="Go client for AMQP"
HOMEPAGE="https://github.com/streadway/amqp"
SRC_URI="https://github.com/streadway/amqp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
