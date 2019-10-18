# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Small, fast, modern HTTP server for Erlang/OTP"
HOMEPAGE="https://github.com/ninenines/cowboy"
SRC_URI="https://github.com/ninenines/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	dev-erlang/cowlib
	>=dev-erlang/ranch-1.6.1
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

DOCS=( CHANGELOG.md )

#src_prepare() {
#	rebar_src_prepare
#	rebar_fix_include_path cowlib
#}
