# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Avro support for Erlang/Elixir"
HOMEPAGE="https://github.com/klarna/erlavro"
SRC_URI="https://github.com/klarna/erlavro/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/jsone-1.4.6
"
BDEPEND=""
