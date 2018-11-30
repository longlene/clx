# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="e6a9f6d55a60f92c20ddb86b22dca93c9b5a7a7b"

DESCRIPTION="A Raft implementation for Erlang and Elixir"
HOMEPAGE="https://github.com/rabbitmq/ra"
SRC_URI="https://github.com/rabbitmq/ra/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""