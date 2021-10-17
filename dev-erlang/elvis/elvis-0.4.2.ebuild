# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="Erlang Style Reviewer"
HOMEPAGE="https://github.com/inaka/elvis"
SRC_URI="https://github.com/inaka/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-erlang/getopt-1.0.1
	>=dev-erlang/egithub-0.5.5
	>=dev-erlang/katana_code-0.1.2
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

REBAR_APP_SRC=src/elvis_shell.app.src

src_compile() {
	rebar_src_compile
	erebar escriptize
}
