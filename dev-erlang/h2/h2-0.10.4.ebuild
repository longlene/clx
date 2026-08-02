# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="HTTP/2 protocol library for Erlang"
HOMEPAGE="https://github.com/benoitc/erlang_h2"
SRC_URI="https://github.com/benoitc/erlang_h2/archive/refs/tags/${PV}.tar.gz -> erlang_${P}.tar.gz"
S="${WORKDIR}/erlang_${P}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
