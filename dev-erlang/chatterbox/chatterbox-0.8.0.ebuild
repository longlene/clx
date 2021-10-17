# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="HTTP/2 Server for Erlang"
HOMEPAGE="https://github.com/joedevivo/chatterbox"
SRC_URI="https://github.com/joedevivo/chatterbox/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-erlang/hpack
"
RDEPEND="${DEPEND}"
BDEPEND=""
