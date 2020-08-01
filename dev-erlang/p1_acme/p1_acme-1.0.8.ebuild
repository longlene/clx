# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="ACME client library for Erlang"
HOMEPAGE="https://github.com/processone/p1_acme"
SRC_URI="https://github.com/processone/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~sparc ~x86"

DEPEND=">=dev-lang/erlang-17.1"
RDEPEND="${DEPEND}
	dev-erlang/jiffy
	dev-erlang/idna
	dev-erlang/jose
	dev-erlang/yconf
"

DOCS=( CHANGELOG.md  README.md )

src_prepare() {
	default
	rm rebar.config.script
	sed -i '/{deps/,$d' rebar.config
}
