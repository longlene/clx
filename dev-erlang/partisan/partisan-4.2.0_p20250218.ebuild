# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

EGIT_COMMIT="01d728a67340b511cb778fe10f1da52ec8f5ccd3"

DESCRIPTION="High-performance, high-scalability distributed computing with Erlang and Elixir"
HOMEPAGE="https://github.com/lasp-lang/partisan"
SRC_URI="https://github.com/lasp-lang/partisan/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/uuid-2.0.5
	>=dev-erlang/acceptor_pool-1.0.0
	>=dev-erlang/types-0.1.8
	>=dev-erlang/lager-3.5
"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	rm -rf bin
	rebar_src_prepare
}
