# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Common library used by rabbitmq-server and rabbitmq-erlang-client"
HOMEPAGE="https://github.com/rabbitmq/rabbitmq-common"
SRC_URI="https://github.com/rabbitmq/rabbitmq-common/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/rabbitmq-common-${PV}

src_prepare() {
	eapply_user
	emake clean
}

src_install() {
	insinto /usr/lib/erlang/lib/${P}
	doins -r ebin
	dodoc README.asciidoc
}
