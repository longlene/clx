# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Pure Erlang QUIC transport for Erlang/OTP 27+"
HOMEPAGE="https://github.com/nomasystems/nquic"
SRC_URI="https://github.com/nomasystems/nquic/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-lang/erlang-27"
