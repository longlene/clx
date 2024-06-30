# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="HTTP client for Erlang based on libcurl and libevent"
HOMEPAGE="https://github.com/puzza007/katipo"
SRC_URI="https://github.com/puzza007/katipo/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/cowlib-2.4.0
	>=dev-erlang/worker_pool-3.1.1
	>=dev-erlang/metrics-2.5.0
"
RDEPEND="${DEPEND}"
BDEPEND=""
