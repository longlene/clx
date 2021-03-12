# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="An Erlang library for building lightweight HTTP servers."
HOMEPAGE="https://github.com/mochi/mochiweb"
SRC_URI="https://github.com/mochi/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="doc src"

DEPEND="dev-lang/erlang"
RDEPEND="${DEPEND}"

