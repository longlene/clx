# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="AWS APIs library for Erlang"
HOMEPAGE="https://github.com/erlcloud/erlcloud"
SRC_URI="https://github.com/erlcloud/erlcloud/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-erlang/meck
	dev-erlang/base16
	dev-erlang/eini
	dev-erlang/jsx
	dev-erlang/lhttpc
"
RDEPEND="${DEPEND}"
BDEPEND=""
