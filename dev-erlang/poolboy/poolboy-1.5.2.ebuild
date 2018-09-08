# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="A hunky Erlang worker pool factory"
HOMEPAGE="https://github.com/devinus/poolboy"
SRC_URI="https://github.com/devinus/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
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
