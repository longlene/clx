# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="The gen_statem behavior for OTPless Erlang"
HOMEPAGE="https://github.com/erlangsters/reactor"
SRC_URI="https://github.com/erlangsters/reactor/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/spawn-mode
"
BDEPEND=""
