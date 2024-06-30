# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang HTTP client"
HOMEPAGE="https://github.com/cmullaparthi/ibrowse"
SRC_URI="https://github.com/cmullaparthi/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL BSD"
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
