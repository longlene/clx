# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Zotonic - The Erlang Web Framework & CMS"
HOMEPAGE="http://zotonic.com"
SRC_URI="https://github.com/zotonic/zotonic/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/webzmachine
	dev-erlang/lager
	dev-erlang/cowboy
	dev-erlang/cowmachine
"
RDEPEND="${DEPEND}"
BDEPEND=""
