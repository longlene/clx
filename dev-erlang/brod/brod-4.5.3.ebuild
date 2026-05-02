# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Apache Kafka client library for Erlang/Elixir"
HOMEPAGE="https://github.com/klarna/brod"
SRC_URI="https://github.com/klarna/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-erlang/supervisor3-1.1.7
	>=dev-erlang/kafka_protocol-2.1.2
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

DOCS=( CHANGELOG )

src_prepare() {
	eapply_user
	rebar_src_prepare
	rebar_fix_include_path supervisor3
	rebar_fix_include_path kafka_protocol
}
