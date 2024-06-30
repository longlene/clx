# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="An emulsifying Erlang SOAP library"
HOMEPAGE="https://github.com/devinus/detergent"
SRC_URI="https://github.com/devinus/detergent/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/erlsom
"
BDEPEND=""
