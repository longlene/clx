# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="An XMPP client library in Erlang for conveniently testing XMPP servers"
HOMEPAGE="https://github.com/esl/escalus"
SRC_URI="https://github.com/esl/escalus/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/exml
	dev-erlang/base16
	dev-erlang/fusco
	dev-erlang/meck
	dev-erlang/mustache
	dev-erlang/uuid
	dev-erlang/gun
	dev-erlang/worker_pool
"
BDEPEND=""
