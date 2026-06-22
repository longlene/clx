# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang implementation of the consistent hashing maglev algorithm"
HOMEPAGE="https://github.com/nomasystems/nmaglev"
SRC_URI="https://github.com/nomasystems/nmaglev/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	# Remove git-fetched erlfmt plugin and its pre-compile hook
	sed -i \
		-e '/^{plugins,/,/^}\./d' \
		-e '/^{provider_hooks,/,/^}\./d' \
		rebar.config || die
	rebar3_src_prepare
}
