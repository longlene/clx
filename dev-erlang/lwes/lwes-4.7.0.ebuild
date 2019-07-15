# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

DESCRIPTION="Light Weight Event System Erlang library"
HOMEPAGE="https://github.com/lwes/lwes-erlang"
SRC_URI="https://github.com/lwes/lwes-erlang/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
