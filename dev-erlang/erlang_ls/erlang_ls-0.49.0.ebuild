# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Erlang Language Server Protocol Implementation"
HOMEPAGE="https://github.com/erlang-ls/erlang_ls"
SRC_URI="https://github.com/erlang-ls/erlang_ls/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/rebar:3
"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT=network-sandbox

src_compile() {
	rebar3 escriptize || die "compile failed"
}

src_install() {
	dobin _build/default/bin/erlang_ls
	dodoc README.md
}
