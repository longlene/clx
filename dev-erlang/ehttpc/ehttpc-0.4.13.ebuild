# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="HTTP Client for Erlang/OTP"
HOMEPAGE="https://github.com/emqx/ehttpc"
SRC_URI="https://github.com/emqx/ehttpc/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/gun-1.3.11
	>=dev-erlang/gproc-0.9.0.1
	>=dev-erlang/snabbkaffe-1.0.7
"
BDEPEND=""
