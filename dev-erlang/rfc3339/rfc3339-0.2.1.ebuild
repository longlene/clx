# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="an erlang/elixir rfc3339 lib"
HOMEPAGE="https://github.com/talentdeficit/rfc3339"
SRC_URI="https://github.com/talentdeficit/rfc3339/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
