# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

DESCRIPTION="ANSI colors for your Erlang"
HOMEPAGE="https://github.com/julianduque/erlang-color"
SRC_URI="https://github.com/julianduque/erlang-color/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
