# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Chess representation written in Erlang using Bitboards"
HOMEPAGE="https://github.com/DOBRO/binbo"
SRC_URI="https://github.com/DOBRO/binbo/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-erlang/uef
"
RDEPEND="${DEPEND}"
BDEPEND=""
