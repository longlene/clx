# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A simple, standardized interface library to Erlang HTTP Servers"
HOMEPAGE="https://github.com/nitrogen/simple_bridge"
SRC_URI="https://github.com/nitrogen/simple_bridge/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
