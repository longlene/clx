# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="An adaptive accrual node failure detection library for Elixir and Erlang"
HOMEPAGE="https://github.com/rabbitmq/aten"
SRC_URI="https://github.com/rabbitmq/aten/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0 Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
