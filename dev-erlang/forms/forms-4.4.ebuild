# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Declarative Documents"
HOMEPAGE="https://github.com/synrc/forms"
SRC_URI="https://github.com/synrc/forms/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/cowboy
	>=dev-erlang/nitro-4.4
	dev-erlang/n2o
	>=dev-erlang/kvs-6.4
"
BDEPEND=""
