# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="be2a6f0a0fd5d1cf3bbbd28df4f2e55930fdee41"

DESCRIPTION="The Erlang Language Server Protocol Implementation"
HOMEPAGE="https://github.com/erlang-ls/erlang_ls"
SRC_URI="https://github.com/erlang-ls/erlang_ls/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/rebar3
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rebar3 get-deps
}

src_install() {
	dobin _build/default/bin/erlang_ls
	dodoc README.md
}
