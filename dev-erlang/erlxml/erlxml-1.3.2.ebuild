# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang XML parsing library based on pugixml"
HOMEPAGE="https://github.com/silviucpp/erlxml"
SRC_URI="https://github.com/silviucpp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

#src_prepare() {
#	rebar_src_prepare
#	rebar_fix_include_path cowlib
#}
