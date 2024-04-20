# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Zotonic - The Erlang Web Framework & CMS"
HOMEPAGE="http://zotonic.com"
SRC_URI="https://github.com/zotonic/zotonic/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/rebar:3
"
RDEPEND="${DEPEND}"
BDEPEND=""

