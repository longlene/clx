# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An automated code formatter for Erlang"
HOMEPAGE="https://github.com/WhatsApp/erlfmt"
SRC_URI="https://github.com/WhatsApp/erlfmt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
|| ( dev-util/rebar:3 dev-util/rebar-bin )
"

RESTRICT=network-sandbox

src_compile() {
	rebar3 as release escriptize || die "compile failed"
}

src_install() {
	dobin _build/release/bin/erlfmt
	dodoc README.md
}
