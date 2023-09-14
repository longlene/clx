# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="DNS server, in erlang"
HOMEPAGE="https://github.com/dnsimple/erldns"
SRC_URI="https://github.com/dnsimple/erldns/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
|| ( dev-util/rebar:3 dev-util/rebar-bin )
"

RESTRICT=network-sandbox

src_prepare() {
	default
	cp erldns.config.example erldns.config
}

src_compile() {
	rebar3 compile && rebar3 release || die "compile failed"
}

src_install() {
	insinto /usr/lib
	doins -r _build/default/rel/erldns
	dosym  /usr/lib/erldns/bin/erldns /usr/bin/erldns
	dodoc README.md
}
