# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang OAuth 2.0 implementation"
HOMEPAGE="https://github.com/processone/p1_oauth2"
SRC_URI="https://github.com/processone/${PN}/archive/${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~ia64 ppc ~sparc x86"
IUSE="test"

CDEPEND=">=dev-lang/erlang-17.1"
DEPEND="${CDEPEND}
	test? (
		>=dev-erlang/meck-0.8.3
		>=dev-erlang/proper-1.1_p20150814
	)"
RDEPEND="${CDEPEND}"

DOCS=( CHANGELOG.md  README.md )

src_test() {
	erebar -C rebar.test.config compile eunit
}
