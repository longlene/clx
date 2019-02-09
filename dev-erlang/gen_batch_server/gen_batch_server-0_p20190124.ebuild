# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="b7cf2f9a9916d05ad93f341b70809caf0de8d551"

DESCRIPTION="A generic batching server for Erlang and Elixir"
HOMEPAGE="https://github.com/rabbitmq/gen-batch-server"
SRC_URI="https://github.com/rabbitmq/gen-batch-server/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""