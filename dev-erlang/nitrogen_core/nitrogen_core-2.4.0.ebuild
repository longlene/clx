# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="The core Nitrogen library"
HOMEPAGE="https://github.com/nitrogen/nitrogen_core"
SRC_URI="https://github.com/nitrogen/nitrogen_core/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/rekt
	dev-erlang/stacktrace_compat
	dev-erlang/simple_bridge
	dev-erlang/nitro_cache
	dev-erlang/nprocreg
	dev-erlang/qdate
"
RDEPEND="${DEPEND}"
BDEPEND=""
