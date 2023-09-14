# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="e598ec52ed2c62eb50e4556dc9cd5adb664de610"

DESCRIPTION="An Erlang language server, providing IDE services"
HOMEPAGE="https://github.com/erlang/sourcer"
SRC_URI="https://github.com/erlang/sourcer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-erlang/rebar:3"

src_compile() {
	rebar3 escriptize || die "build failed"
}

src_install() {
	dobin _build/default/bin/erlang_ls
	dodoc README.md
}
