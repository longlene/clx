# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Social Authorization"
HOMEPAGE="https://github.com/synrc/avz"
SRC_URI="https://github.com/synrc/avz/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/nitro
	dev-erlang/n2o
	dev-erlang/kvs
	dev-erlang/erlydtl
	>=dev-erlang/oauth-1.6.0
"
BDEPEND=""
