# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Pure functional HTTP/1.1, HTTP/2, and HTTP/3 codec for Erlang/OTP 27+"
HOMEPAGE="https://github.com/nomasystems/nhttp_lib"
SRC_URI="https://github.com/nomasystems/nhttp_lib/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/nhttp_lib-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-lang/erlang-27
	>=dev-erlang/nquic-1.0.0
"
