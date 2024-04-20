# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A Mini RESTful API framework"
HOMEPAGE="https://github.com/emqx/minirest"
SRC_URI="https://github.com/emqx/minirest/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/cowboy-2.9.0
	>=dev-erlang/cowboy_swagger-2.5.0
"
BDEPEND=""
