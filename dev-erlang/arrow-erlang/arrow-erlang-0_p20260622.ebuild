# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Official Erlang implementation of Apache Arrow"
HOMEPAGE="https://arrow.apache.org/erlang/"
SRC_URI="https://github.com/apache/arrow-erlang/archive/refs/heads/master.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/arrow-erlang-main"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	dev-lang/rust
	dev-util/rebar:3
	>=sys-apps/gawk-4.1
"

inherit rebar3

src_prepare() {
	default
	rm -f rebar.lock || die
	if [[ -f rebar.config ]]; then
		sed -i '/{deps, \[\]}/d' rebar.config || die
		sed -i '/{plugins, \[/s/\],/}/' rebar.config || die
	fi
}

src_install() {
	rebar3_install_lib _build/default/lib/arrow
}
