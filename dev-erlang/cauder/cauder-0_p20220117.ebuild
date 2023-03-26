# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="051e3f31c25bc11905af396028acd77064e081cf"

DESCRIPTION="A Causal-Consistent Reversible Debugger for Erlang"
HOMEPAGE="https://github.com/mistupv/cauder"
SRC_URI="https://github.com/mistupv/cauder/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-lang/erlang[wxwidgets]"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/rebar:3"

src_compile() {
	rebar3 escriptize || die "compile failed"
}

src_install() {
	dobin _build/default/bin/cauder
	einstalldocs
}
