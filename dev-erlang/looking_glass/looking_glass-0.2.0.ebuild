# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="An Erlang/Elixir/BEAM profiler tool"
HOMEPAGE="https://github.com/rabbitmq/looking_glass"
SRC_URI="https://github.com/rabbitmq/looking_glass/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

