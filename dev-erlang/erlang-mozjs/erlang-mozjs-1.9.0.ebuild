# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A NIF module for Erlang to Mozilla's Spidermonkey Javascript runtime"
HOMEPAGE="https://github.com/erlang-mozjs/erlang-mozjs"
SRC_URI="https://github.com/erlang-mozjs/erlang-mozjs/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/mochiweb
"
BDEPEND=""

REBAR_APP_SRC="src/mozjs.app.src"
