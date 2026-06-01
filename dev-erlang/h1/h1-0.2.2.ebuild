# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="HTTP/1.1 client and server for Erlang/OTP"
HOMEPAGE="https://github.com/benoitc/erlang_h1"
SRC_URI="https://github.com/benoitc/erlang_h1/archive/refs/tags/${PV}.tar.gz -> erlang_${P}.tar.gz"
S="${WORKDIR}/erlang_h1-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
