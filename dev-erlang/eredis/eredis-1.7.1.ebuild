# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang Redis client"
HOMEPAGE="https://github.com/Nordix/eredis"
SRC_URI="https://github.com/Nordix/${PN}/archive/v${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ia64 ppc ~sparc x86"

DEPEND=">=dev-lang/erlang-17.1"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS  CHANGELOG.md  README.md )

# Needs running redis instance at 127.0.0.1:6379.
RESTRICT=test

src_prepare() {
	default
	sed -e '/plugins/d' \
		-i rebar.config
}
