# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar3

DESCRIPTION="An ncurses library for Erlang"
HOMEPAGE="https://github.com/mazenharake/cecho"
SRC_URI="https://github.com/mazenharake/cecho/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
