# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

MY_PN=Concuerror

DESCRIPTION="Concuerror is a stateless model checking tool for Erlang programs"
HOMEPAGE="https://github.com/parapluu/Concuerror"
SRC_URI="https://github.com/parapluu/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-erlang/getopt-1.0.1
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

DOCS=( CHANGELOG.md )

#src_prepare() {
#	rebar_src_prepare
#	rebar_fix_include_path cowlib
#}

src_compile() {
	rebar_src_compile
	erebar escriptize
}
