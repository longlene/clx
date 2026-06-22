# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="High-performance Erlang Memcached client"
HOMEPAGE="https://github.com/lpgauth/anchor"
SRC_URI="https://github.com/lpgauth/anchor/archive/refs/tags/v${PV}.tar.gz
	-> erlang_${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
