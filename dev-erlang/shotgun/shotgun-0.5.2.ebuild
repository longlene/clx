# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="For the times you need more than just a gun"
HOMEPAGE="https://github.com/inaka/shotgun"
SRC_URI="https://github.com/inaka/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	dev-erlang/gun
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

DOCS=( CHANGELOG )

#src_prepare() {
#	rebar_src_prepare
#	rebar_fix_include_path cowlib
#}
