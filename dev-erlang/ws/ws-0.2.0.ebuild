# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="WebSocket protocol library (RFC 6455 / RFC 8441 / RFC 9220)"
HOMEPAGE="https://github.com/benoitc/erlang_ws"
SRC_URI="https://github.com/benoitc/erlang_ws/archive/refs/tags/${PV}.tar.gz -> erlang_${P}.tar.gz"
S="${WORKDIR}/erlang_ws-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
