# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="The gen_server behavior for OTPless Erlang"
HOMEPAGE="https://github.com/erlangsters/worker"
SRC_URI="https://github.com/erlangsters/worker/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/spawn-mode
"
BDEPEND=""
