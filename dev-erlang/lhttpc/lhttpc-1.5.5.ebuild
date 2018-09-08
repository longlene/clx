# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="lhttpc is a lightweight HTTP/1.1 client implemented in Erlang"
HOMEPAGE="https://github.com/erlcloud/lhttpc"
SRC_URI="https://github.com/erlcloud/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

DOCS=( CHANGELOG )

#src_prepare() {
#	rebar_src_prepare
#	rebar_fix_include_path cowlib
#}
